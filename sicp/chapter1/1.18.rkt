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
  (define (iter 2a counter sum)
    (cond [(= counter 1) (+ 2a sum)]
          [(isEven? counter) (iter (double 2a) (halve counter) sum)]
          [else (iter (double 2a) (halve (-- counter)) (+ sum 2a))]))
  (if (or (= a 0) (= b 0))
      0
      (iter a b 0)))
          

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
