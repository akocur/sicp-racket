#lang sicp

(#%require rackunit)

(define (sum term a next b)
    (define (iter x result)
        (if (> x b)
            result
            (iter (next x) (+ result (term x)))
        )
    )
    (iter a 0)
)

(define (inc x) (+ x 1))
(check-equal? (sum identity 1 inc 2) 3)
