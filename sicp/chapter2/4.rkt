#lang sicp

(#%require rackunit)

#|review: ignore|#

(define (cons x y) (lambda (f) (f x y)))
(define (car z) (z (lambda (p q) p)))
(define (cdr z) (z (lambda (p q) q)))

(check-equal? (car (cons 2 3)) 2)
(check-equal? (cdr (cons 2 3)) 3)
