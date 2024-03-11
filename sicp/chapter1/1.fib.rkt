#lang sicp
(#%require rackunit)

(define (fib n)
  (cond [(< n 2) n]
        [else (+ (fib (- n 1))
                 (fib (- n 2)))]))


(define (fib-i n)
  (define (iter fib/n-1 fib/n-2 counter)
    (cond [(= counter 0) fib/n-2]
          [else (iter (+ fib/n-1 fib/n-2)
                          fib/n-1
                          (- counter 1))]))
  (iter 1 0 n))




(define solution (list (fib-i 0) (fib-i 3) (fib-i 25)))
(define test (list (fib 0) (fib 3) (fib 25)))
(check-equal? solution test) 

