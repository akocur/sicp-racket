#lang sicp

(#%require rackunit)

(define (binominal-coefficient n i)
    (cond ((> i n) 0)
        ((= i 0) 1)
        ((= i n) 1)
        (else (+
                (binominal-coefficient (- n 1) (- i 1))
                (binominal-coefficient (- n 1) i)
            )
        )
    )
)

(check-equal? (binominal-coefficient 0 0) 1)
(check-equal? (binominal-coefficient 5 10) 0)
(check-equal? 
    (binominal-coefficient 20 10)
    (+ (binominal-coefficient 19 9) (binominal-coefficient 19 10))
)
