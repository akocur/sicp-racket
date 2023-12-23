#lang sicp

(#%require rackunit)

#|review: ignore|#

(define (square a) (* a a))

(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
        (else (remainder (* base (expmod base (- exp 1) m)) m))
    )
)

(define (fermat-test n)
    (define (try-it a)
        (= (expmod a n n) a)
    )
    (try-it (+ (random (- n 1)) 1))
)

(define (fast-prime? n times)
    (cond 
        ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)
    )
)

(define (timed-prime-test n)
    (define (start-prime-test start-time)
        (if (fast-prime? n 10)
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
                (search-for-primes-iter (+ n 2) (if (fast-prime? n 10) (+ found-count 1) found-count))
            )
        )
    )

    (search-for-primes-iter (if (even? begin) (+ begin 1) begin) 0)
)

(check-equal? (fast-prime? 7 10) #t)
(check-equal? (fast-prime? 6 10) #f)

#| Замеры времени 
1000
min 6

10 000
min 8

100 000
min 9

1 000 000
min 10

100 000 000
min 16
|#