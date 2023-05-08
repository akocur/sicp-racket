#lang sicp

(#%require rackunit)

(define (sqrt x) (sqrt-iter 1 x)) #|review: ignore|#

(define (sqrt-iter guess x)
    (if-new (good-enough? guess x) ;даже когда good-enough? вернет #t третий параметр продолжит вычисляться.
        guess
        (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (improve guess x)
 (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2.0))

(define (if-new predicate then-case else-case)
    (cond (predicate then-case)
        (else else-case)))

(check-equal? (average 3 2) 2.5)
(check-equal? (square 3) 9)
(check-equal? (good-enough? 2 9) #f)
(check-equal? (good-enough? 3.0001 9) #t)
(check-equal? (improve 1 2) 1.5)
;(check-within (sqrt 9) 3 0.001) не выполнится. будет бесконечная рекурсия из за аппликативного порядка вычисления.