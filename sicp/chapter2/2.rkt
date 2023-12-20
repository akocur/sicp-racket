#lang sicp

(#%require rackunit)

(define (midle a b) (/ (+ a b) 2))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment start-point end-point) (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (midpoint-segment segment)
    (let (
            [start-point (start-segment segment)]
            [end-point (end-segment segment)]
        )
        (make-point
            (midle (x-point start-point) (x-point end-point))
            (midle (y-point start-point) (y-point end-point))
        )
    )
)

(define s1 (make-segment (make-point 0 0) (make-point 4 4)))
(check-equal? (midpoint-segment s1) (make-point 2 2))
