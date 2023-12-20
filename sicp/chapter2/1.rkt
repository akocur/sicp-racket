#lang sicp

(#%require rackunit)

(define (make-rat n d)
    (let ([g (gcd n d)])
        (if (or (and (negative? n) (negative? d)) (and (>= n 0) (>= d 0)))
            (cons (/ (abs n) g) (/ (abs d) g))
            (cons (/ (- (abs n)) g) (/ (abs d) g))
        )
    )
)
(define (numer x) (car x))
(define (demon x) (cdr x))

(define (add-rat x1 x2)
    (make-rat 
        (+ (* (numer x1) (demon x2)) (* (numer x2) (demon x1)))
        (* (demon x1) (demon x2))
    )
)

(define (sub-rat x1 x2)
    (make-rat 
        (- (* (numer x1) (demon x2)) (* (numer x2) (demon x1)))
        (* (demon x1) (demon x2))
    )
)

(define (mul-rat x1 x2)
    (make-rat 
        (* (numer x1) (numer x2))
        (* (demon x1) (demon x2))
    )
)

(define (div-rat x1 x2)
    (make-rat 
        (* (numer x1) (demon x2))
        (* (numer x2) (demon x1))
    )
)

(define (equal-rat x1 x2)
    (= (* (numer x1) (demon x2)) (* (numer x2) (demon x1)))
)

#| (define (print-rat x) 
    (newline)
    (display (numer x))
    (display "/")
    (display (demon x))
) |#

(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))
(define minus-one-third (make-rat 1 -3))
(define minus-one-half (make-rat -1 2))

(check-equal? (add-rat one-half one-third) (make-rat 5 6))
(check-equal? (sub-rat one-half one-third) (make-rat 1 6))
(check-equal? (mul-rat one-half one-third) (make-rat 1 6))
(check-equal? (div-rat one-half one-third) (make-rat 3 2))
(check-true (equal-rat one-half one-half))
(check-false (equal-rat one-half one-third))
(check-equal? (numer (make-rat 2 4)) 1)
(check-equal? (demon (make-rat 2 4)) 2)
(check-equal? (numer (make-rat -1 -3)) 1)
(check-equal? (demon (make-rat -1 -3)) 3)
(check-equal? (numer (make-rat -1 3)) -1)
(check-equal? (demon (make-rat -1 3)) 3)
(check-equal? (numer (make-rat 1 -3)) -1)
(check-equal? (demon (make-rat 1 -3)) 3)
(check-equal? (mul-rat minus-one-third minus-one-half) (make-rat 1 6))
(check-equal? (mul-rat minus-one-third minus-one-third) (make-rat 1 9))
(check-equal? (mul-rat minus-one-third one-half) (make-rat -1 6))
