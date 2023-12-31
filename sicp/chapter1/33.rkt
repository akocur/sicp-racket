#lang sicp

(#%require rackunit)

(define (filtered-accumulate filter combiner null-value term a next b)
    (define (iter x result)
        (if (> x b)
            result
            (iter (next x) (combiner result (if (filter x) (term x) null-value)))
        )
    )

    (iter a null-value)
)

(define (square x) (* x x))

(define (inc x) (+ x 1))

(define (smallest-divisor n)
    (define (smallest-divisor-iter test-divisor)
        (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (smallest-divisor-iter (next test-divisor)))
        )
    )
    (define (next x) (if (= x 2) 3 (+ x 2)))
    (define (divides? a b) (= (remainder b a) 0))

    (smallest-divisor-iter 2)
)

(define (prime? n) (= (smallest-divisor n) n))

(define (sum-of-squares-of-prime-numbers a b)
    (filtered-accumulate prime? + 0 square a inc b)
)

(define (product-of-primes-with-recpect-to-n n)
    (define (prime-to-n? i)
        (= (gcd i n) 1)
    )

    (filtered-accumulate prime-to-n? * 1 identity 1 inc (- n 1))
)

(check-equal? (sum-of-squares-of-prime-numbers 3 4) 9)
(check-equal? (product-of-primes-with-recpect-to-n 10) 189)
