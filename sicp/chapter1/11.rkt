#lang sicp

(#%require rackunit)

(define (f-recursive-process n)
    (if (< n 3)
        n
        (+ 
            (f-recursive-process (- n 1))
            (f-recursive-process (- n 2))
            (f-recursive-process (- n 3))
        )
    )
)

(define (f-iter-process n)
    (define (f-iter a b c count)
        (if (= count 0)
            c
            (f-iter b c (+ a b c) (- count 1))
        )
    )
    (if (< n 3)
        n
        (f-iter 0 1 2 (- n 2))
    )
)

(check-equal? (f-recursive-process 0) 0)
(check-equal? (f-recursive-process 3) 3)
(check-equal? (f-recursive-process 4) 6)

(check-equal? (f-iter-process 0) 0)
(check-equal? (f-iter-process 1) 1)
(check-equal? (f-iter-process 2) 2)
(check-equal? (f-iter-process 3) 3)
(check-equal? (f-iter-process 4) 6)
(check-equal? (f-iter-process 5) 11)
(check-equal? (f-iter-process 6) 20)
(check-equal? (f-iter-process 7) 37)
(check-equal? (f-iter-process 8) 68)