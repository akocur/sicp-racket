#lang sicp

(#%require rackunit)

(define (* a b)
    (define (iter c d m)
        (cond ((= d 1) (+ m c))
            ((even? d) (iter (double c) (halve d) m))
            (else (iter c (- d 1) (+ m c)))
        )
    )
    (if (= b 0)
        0
        (iter a b 0)
    )
)

(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? x) (= (remainder x 2) 0))

(check-equal? (* 5 0) 0)
(check-equal? (* 7 1) 7)
(check-equal? (* 2 3) 6)
(check-equal? (* 3 8) 24)
(check-equal? (* 3 13) 39)
