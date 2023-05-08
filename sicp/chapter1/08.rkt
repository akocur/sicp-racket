#lang sicp

(#%require rackunit)

(define (cubic-root x) (sqrt-iter 1 x 0))

(define (sqrt-iter guess x previous-guess)
    (if (good-enough? guess previous-guess)
        guess
        (sqrt-iter (improve guess x) x guess)))

(define (good-enough? guess previous-guess)
    (< (abs (- guess previous-guess)) 0.00000000001))

(define (square x) (* x x))

(define (improve guess x)
 (/ (+ (/ x (square guess)) (* 2.0 guess)) 3.0))

(check-within (cubic-root 27) 3 0.001)
(check-within (cubic-root 0.000001) 0.01 0.001)
(check-within (cubic-root 874545616547) 9563 0.001)
