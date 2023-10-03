#lang sicp

(#%require rackunit)

(define (smallest-divisor n)
    (define (smallest-divisor-iter test-divisor)
        (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (smallest-divisor-iter (+ test-divisor 1)))
        )
    )

    (define (divides? a b) (= (remainder b a) 0))

    (smallest-divisor-iter 2)
)

(define (square a) (* a a))

(check-equal? (smallest-divisor 199) 199)
(check-equal? (smallest-divisor 1999) 1999)
(check-equal? (smallest-divisor 19999) 7)

