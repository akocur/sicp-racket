#lang sicp

(#%require rackunit)

(define (product-recursive term a next b)
    (if (> a b)
        1
        (* (term a) (product-recursive term (next a) next b))
    )
)

(define (product-iter term a next b)
    (define (iter x result)
        (if (> x b)
            result
            (iter (next x) (* result (term x)))
        )
    )
    (iter a 1)
)

(define (inc x) (+ x 1))

(define (factorial-via-recursion n)
    (product-recursive identity 1 inc n)
)

(define (factorial-via-iter n)
    (product-iter identity 1 inc n)
)

(check-equal? (factorial-via-recursion 5) 120)
(check-equal? (factorial-via-recursion 0) 1)

(check-equal? (factorial-via-iter 5) 120)
(check-equal? (factorial-via-iter 0) 1)
