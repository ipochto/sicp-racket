#lang sicp
(#%require rackunit)

(define (square x) 
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (larger x y)
  (if (> x y) x
              y))

(define (smaller x y)
  (if (< x y) x
              y))

(define (square-sum-larger a b c)
  (sum-of-squares (larger a b)
                  (larger (smaller a b) c )))

(define solution (square-sum-larger 4 -10 2))
(check-equal? solution 20) ; (4 -10 2) -> 20
