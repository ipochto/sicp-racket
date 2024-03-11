#lang sicp
(#%require rackunit)

(define (pascal row col)
  (cond [(or (= col 0) (= col row)) 1]
        [(or (< col 0) (< row 0) (> col row)) 0]
        [else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col))]))

(define solution (list (pascal 0 0)
                       (pascal 2 1)
                       (pascal 5 3)
                       (pascal 6 7)
                       (pascal 10 10)))
(define test (list 1 2 10 0 1))
(check-equal? solution test) 
        

