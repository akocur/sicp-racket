#lang sicp

(#%require rackunit)

(define (fast-expt b n)
    (define (expt-iter p a)
        (cond ((= p 0) a)
            ((even? p) (expt-iter (/ p 2) (square a)))
            (else (expt-iter (- p 1) (* b a)))
        )
    )
    (expt-iter n 1)
)

(define (square x)
    (* x x)
)

(define (even? x)
    (= (remainder x 2) 0)
)

(check-equal? (fast-expt 2 3) 8)
(check-equal? (fast-expt 5 0) 1)
