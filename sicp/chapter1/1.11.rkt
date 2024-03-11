#lang sicp
(#%require rackunit)

(define (f n)
  (cond [(< n 3) n]
        [else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3))))]))

(define (f-i n)
  (define (iter f/n-1 f/n-2 f/n-3 counter)
    (cond [(= counter 0) f/n-3]
          [(< counter 0) counter]
          [else (iter (+ f/n-1 (* 2 f/n-2) (* 3 f/n-3))
                        f/n-1
                        f/n-2
                        (- counter 1))]))
  (iter 2 1 0 n))

(define solution (list (f-i 0) (f-i 1) (f-i 2) (f-i 7) (f-i 15)))
(define test (list (f 0) (f 1) (f 2) (f 7) (f 15)))
(check-equal? solution test) 
        

