#lang sicp

(#%require rackunit)

(define (sqrt x) (sqrt-iter 1 x 0))

(define (sqrt-iter guess x previous-guess)
    (if (good-enough? guess previous-guess)
        guess
        (sqrt-iter (improve guess x) x guess)))

(define (good-enough? guess previous-guess)
    (< (abs (- guess previous-guess)) 0.00000000001))

(define (square x) (* x x))

(define (improve guess x)
 (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2.0))

(check-equal? (average 3 2) 2.5)
(check-equal? (square 3) 9)
(check-equal? (good-enough? 2 9) #f)
(check-equal? (good-enough? 3.000000000001 3) #t)
(check-equal? (improve 1 2) 1.5)
(check-within (sqrt 9) 3 0.001)
(check-within (sqrt 1048576) 1024 0.001)
