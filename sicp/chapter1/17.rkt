#lang sicp

(#%require rackunit)

(define (* a b)
    (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))   
    )
)

(define (double x) (+ x x))
(define (halve x) (/ x 2))
(define (even? x) (= (remainder x 2) 0))

(check-equal? (* 5 0) 0)
(check-equal? (* 7 1) 7)
(check-equal? (* 2 3) 6)
(check-equal? (* 3 8) 24)
