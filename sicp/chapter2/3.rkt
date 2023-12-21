#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (make-segment start-point end-point) (cons start-point end-point))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))
(define (length-segment segment)
    (let ([p1 (start-segment segment)] [p2 (end-segment segment)])
        (sqrt 
            (+ 
                (square (- (x-point p1) (x-point p2)))
                (square (- (y-point p1) (y-point p2)))
            )
        )
    )   
)

(define (make-rectangle segment-a segment-b) (cons segment-a segment-b))
(define (a-segment rectangle) (car rectangle))
(define (b-segment rectangle) (cdr rectangle))

#| (define (make-rectangle top1 top2 top3 top4) (cons (cons top1 top2) (cons top3 top4)))
(define (top1 rectangle) (car (car rectangle)))
(define (top2 rectangle) (cdr (car rectangle)))
(define (top3 rectangle) (car (cdr rectangle)))
(define (top4 rectangle) (cdr (cdr rectangle)))
(define (a-segment rectangle) (make-segment (top1 rectangle) (top2 rectangle)))
(define (b-segment rectangle) (make-segment (top2 rectangle) (top3 rectangle)))
 |#
 
(define (a-length rectangle)(length-segment (a-segment rectangle)))
(define (b-length rectangle) (length-segment (b-segment rectangle)))

(define (perimeter-rectangle rectangle) (* 2 (+ (a-length rectangle) (b-length rectangle))))
(define (square-rectangle rectangle) (* (a-length rectangle) (b-length rectangle)))

(define p1 (make-point 0 0))
(define p2 (make-point 0 4))
(define p3 (make-point 6 4))
; (define p4 (make-point 6 0))
(define a (make-segment p1 p2))
(define b (make-segment p2 p3))

(define rectangle (make-rectangle a b))
; (define rectangle (make-rectangle p1 p2 p3 p4))

(check-equal? (perimeter-rectangle rectangle) 20)
(check-equal? (square-rectangle rectangle) 24)
