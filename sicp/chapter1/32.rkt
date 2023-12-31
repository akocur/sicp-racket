#lang sicp

(#%require rackunit)

(define (accumulate-recusive combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate-recusive combiner null-value term (next a) next b))
    )
)

(define (accumulate-iter combiner null-value term a next b)
    (define (iter x result)
        (if (> x b)
            result
            (iter (next x) (combiner result (term x)))
        )
    )

    (iter a null-value)
)

(define (sum-via-recursion term a next b)
    (accumulate-recusive + 0 term a next b)
)

(define (sum-via-iter term a next b)
    (accumulate-iter + 0 term a next b)
)

(define (product-via-recursion term a next b)
    (accumulate-recusive * 1 term a next b)
)

(define (product-via-iter term a next b)
    (accumulate-iter * 1 term a next b)
)

(define (inc x) (+ x 1))

(check-equal? (sum-via-recursion identity 0 inc 5) 15)
(check-equal? (sum-via-recursion identity 6 inc 5) 0)

(check-equal? (sum-via-iter identity 0 inc 5) 15)
(check-equal? (sum-via-iter identity 6 inc 5) 0)

(check-equal? (product-via-recursion identity 1 inc 5) 120)
(check-equal? (product-via-recursion identity 1 inc 0) 1)

(check-equal? (product-via-iter identity 1 inc 5) 120)
(check-equal? (product-via-iter identity 1 inc 0) 1)
