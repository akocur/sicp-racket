#lang sicp

(#%require rackunit)

(define (smallest-divisor n)
    (define (smallest-divisor-iter test-divisor)
        (cond ((> (square test-divisor) n) n)
            ((divides? test-divisor n) test-divisor)
            (else (smallest-divisor-iter (next test-divisor)))
        )
    )
    (define (next x) (if (= x 2) 3 (+ x 2)))
    (define (divides? a b) (= (remainder b a) 0))

    (smallest-divisor-iter 2)
)

(define (prime? n) (= (smallest-divisor n) n))
(define (square a) (* a a))

(define (timed-prime-test n)
    (define (start-prime-test start-time)
        (if (prime? n)
            (report-prime (- (runtime) start-time))
        )
    )
    (define (report-prime elapsed-time)
        (display " *** ")
        (display elapsed-time)
    )
    
    (newline)
    (display n)
    (start-prime-test (runtime))
)

(define (search-for-primes begin count)
    (define (search-for-primes-iter n found-count)
        (cond ((< found-count count) 
                (timed-prime-test n)
                (search-for-primes-iter (+ n 2) (if (prime? n) (+ found-count 1) found-count))
            )
        )
    )

    (search-for-primes-iter (if (even? begin) (+ begin 1) begin) 0)
)

(check-equal? (prime? 7) #t)
(check-equal? (prime? 6) #f)

#| Замеры времени 
1000
min 1

10 000
min 1

100 000
min 3

1 000 000
min 5

100 000 000
min 53

10 000 000 000
min 400
|#