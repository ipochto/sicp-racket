#lang sicp
(#%require rackunit)

(define (isEven? x)
  (= (remainder x 2) 0))

(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))

(define (-- x)
  (- x 1))

(define (mul a b)
  (cond [(or (= a 0) (= b 0)) 0]
        [(= b 1) a]
        [(isEven? b) (mul (double a) (halve b))]
        [else (+ a (mul (double a) (halve (-- b))))]))

(define (square x) 
  (mul x x))

(define (fast-exp b n)
  (define (iter bb counter product)
    (if (= counter 0)
        product
        (iter bb (-- counter) (mul product bb))))
  (if (isEven? n)
      (iter (square b) (halve n) 1)
      (iter (square b) (halve (-- n)) b)))



(define solution (list (fast-exp 2 16)
                       (fast-exp 2 15)
                       (fast-exp 2 1)
                       (fast-exp 2 0)))

(check-equal? solution (list (expt 2 16)
                             (expt 2 15)
                             (expt 2 1)
                             (expt 2 0)))
