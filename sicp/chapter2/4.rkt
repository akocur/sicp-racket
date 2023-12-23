#lang sicp

(#%require rackunit)

(define (cons x y) (lambda (f) (f x y)))
(define (car z) (z (lambda (p _) p)))
(define (cdr z) (z (lambda (_ q) q)))

(check-equal? (car (cons 2 3)) 2)
(check-equal? (cdr (cons 2 3)) 3)
