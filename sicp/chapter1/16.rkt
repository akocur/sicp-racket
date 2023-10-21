#lang sicp

(#%require rackunit)

(define (fast-expt base exp)
    (define (expt-iter b e product)
        (cond ((= e 0) product)
            ((even? e) (expt-iter (square b) (/ e 2) product))
            (else (expt-iter b (- e 1) (* b product)))
        )
    )
    (expt-iter base exp 1)
)

(define (square x)
    (* x x)
)

(define (even? x)
    (= (remainder x 2) 0)
)


(check-equal? (fast-expt 2 0) 1)
(check-equal? (fast-expt 2 1) 2)
(check-equal? (fast-expt 2 2) 4)
(check-equal? (fast-expt 2 3) 8)
(check-equal? (fast-expt 2 4) 16)
(check-equal? (fast-expt 2 5) 32)
(check-equal? (fast-expt 2 8) 256)
