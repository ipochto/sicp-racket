#lang sicp

(define (count-change amount)
  (cc amount 5))

(define (cc amount kind-of-coins)
  (cond [(= amount 0) 1]
        [(or (< amount 0) (= kind-of-coins 0)) 0]
        [else (+ (cc amount
                     (- kind-of-coins 1))
                 (cc (- amount (coin-value kind-of-coins))
                     kind-of-coins))]))

(define (coin-value idx)
  (cond [(= idx 1) 1]
        [(= idx 2) 5]
        [(= idx 3) 10]
        [(= idx 4) 25]
        [(= idx 5) 50]
        [else (error "wrong coin")]))