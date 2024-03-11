#lang sicp
(#%require rackunit)

(define (square x) 
  (* x x))

(define (-- x)
  (- x 1))

(define (isEven? x)
  (= (remainder x 2) 0))

(define (fast-exp b n)
  (define (iter bb counter product)
    (if (= counter 0)
        product
        (iter bb (-- counter) (* product bb))))
  (if (isEven? n)
      (iter (square b) (/ n 2) 1)
      (iter (square b) (/ (-- n) 2) b)))



(define solution (list (fast-exp 2 16)
                       (fast-exp 2 15)
                       (fast-exp 2 1)
                       (fast-exp 2 0)))

(check-equal? solution (list (expt 2 16)
                             (expt 2 15)
                             (expt 2 1)
                             (expt 2 0)))
