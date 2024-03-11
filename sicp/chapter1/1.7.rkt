#lang sicp
(#%require rackunit)

(define (sqrt x)
  (define deviationLimit 0.00001)
  (define (sqrt-iter guess prevGuess)
    (if (isGoodEnough? (- guess prevGuess))
        guess
        (sqrt-iter (improve guess) guess)))
  (define (isGoodEnough? deviation)
    (< (abs deviation)
       deviationLimit))
  (define (improve guess)
    (average (/ x guess) guess))
  (define (average a b)
    (/ (+ a b)
       2))
  (sqrt-iter 1.0 x))


(check-= (sqrt 32765) (expt 32765 1/2) 0.00001)
