#lang sicp

(#%require rackunit)

(define (square x) (* x x))

(define (sum-of-squares x1 x2 x3)
 (+ (square (max x1 x2)) (square (max (min x1 x2) x3))))

(check-equal? (sum-of-squares 1 2 3) 13)
(check-equal? (sum-of-squares 1 3 2) 13)
(check-equal? (sum-of-squares 3 2 1) 13)
(check-equal? (sum-of-squares 2 3 1) 13)
(check-equal? (sum-of-squares 2 1 3) 13)
(check-equal? (sum-of-squares 3 1 2) 13)
(check-equal? (sum-of-squares 0 3 -3) 9)
