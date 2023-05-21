#lang sicp

(#%require rackunit)

(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))
    )
)

(check-equal? (A 1 10) 1024)
(check-equal? (A 2 4) 65536)
(check-equal? (A 3 3) 65536)


(define (f n) (A 0 n))  ; 2n, где n>=0
(define (g n) (A 1 n))  ; 2^n при n>0; 0 при n=0
(define (h n) (A 2 n))  ; 2^(h(n-1)) при n>1; 2 при n=1; 0 при n=0
(define (k n) (* 5 n n))  ; 5n^2

(check-equal? (f 0) (* 2 0))
(check-equal? (f 1) (* 2 1))
(check-equal? (f 2) (* 2 2))
(check-equal? (f 3) (* 2 3))
(check-equal? (f 100) (* 2 100))

(check-equal? (g 1) (expt 2 1))
(check-equal? (g 2) (expt 2 2))
(check-equal? (g 3) (expt 2 3))
(check-equal? (g 100) (expt 2 100))

(check-equal? (h 1) (expt 2 1))
(check-equal? (h 2) (expt 2 (h 1)))
(check-equal? (h 3) (expt 2 (h 2)))
(check-equal? (h 4) (expt 2 (h 3)))
(check-equal? (h 5) (expt 2 (h 4)))

(check-equal? (k 0) (* 5 0 0))
(check-equal? (k 1) (* 5 1 1))
(check-equal? (k 2) (* 5 2 2))
(check-equal? (k 3) (* 5 3 3))
(check-equal? (k 100) (* 5 100 100))
