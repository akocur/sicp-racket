#lang sicp

(#%require rackunit)

(define (fib n)
    (define (fib-iter a b p q count)
        (cond (( = count 0) b)
            ((even? count)
                (fib-iter
                    a
                    b
                    (+ (square p) (square q))
                    (+ (* 2 p q) (square q))
                    (/ count 2)
                )
            )
            (else 
                (fib-iter
                    (+ (* b q) (* a q) (* a p))
                    (+ (* b p) (* a q))
                    p
                    q
                    (- count 1)
                )
            )
        )
    )
    (fib-iter 1 0 0 1 n)
)

(define (square x) (* x x))
(define (even? x) (= (remainder x 2) 0))

(check-equal? (fib 0) 0)
(check-equal? (fib 1) 1)
(check-equal? (fib 2) 1)
(check-equal? (fib 3) 2)
(check-equal? (fib 4) 3)
(check-equal? (fib 5) 5)
(check-equal? (fib 6) 8)
(check-equal? (fib 100) (+ (fib 98) (fib 99)))
