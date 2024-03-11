#lang sicp
(#%require rackunit)

(define (square x)
  (* x x))

(define (cube-root x)
  (define deviationLimit 0.00001)
  (define (cube-root-iter guess prevGuess)
    (if (isGoodEnough? (- guess prevGuess))
        guess
        (cube-root-iter (improve guess) guess)))
  (define (isGoodEnough? deviation)
    (< (abs deviation)
       deviationLimit))
  (define (improve guess)
    (/ (+ (/ x (square guess)) (* 2.0 guess))
       3.0))
  (cube-root-iter 1.0 x))


(check-= (cube-root 900) (expt 900 1/3) 0.00001)

  
