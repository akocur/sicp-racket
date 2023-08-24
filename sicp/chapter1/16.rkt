#lang sicp

(#%require rackunit)

(define (fast-expt b n)
    (define (expt-iter b n a)
        (cond ((= n 0) a)
            ((even? n) (expt-iter b (/ n 2) (square a)))
            (else (expt-iter b (- n 1) (* b a)))
        )
    )
    (expt-iter b n 1)
)

(define (square x)
    (* x x)
)

(define (even? x)
    (= (remainder x 2) 0)
)

(check-equal? (fast-expt 2 3) 8)
(check-equal? (fast-expt 5 0) 1)
