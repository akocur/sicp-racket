#lang sicp

(#%require rackunit)

#|review: ignore|#

(define (square a) (* a a))

(define (fast-expt base exp)
    (define (expt-iter b e product)
        (cond ((= e 0) product)
            ((even? e) (expt-iter (square b) (/ e 2) product))
            (else (expt-iter b (- e 1) (* b product)))
        )
    )
    (expt-iter base exp 1)
)

(define (expmod-slow base exp m)
    (remainder (fast-expt base exp) m)
)

(define (expmod base exp m)
    (cond
        ((= exp 0) 1)
        (
            (even? exp)
            (remainder 
                (square (expmod base (/ exp 2) m))
                m
            )
        )
        (else (remainder (* base (expmod base (- exp 1) m)) m))
    )
)

(define (timed-expmod-test base exp mod)
    (define (start-expmod-test f-expmod start-time)
        (f-expmod base exp mod)
        (report-expmod f-expmod (- (runtime) start-time))
    )

    (define (report-expmod f-expmod elapsed-time)
        (display "; ")
        (display f-expmod)
        (display " = ")
        (display elapsed-time)
    )
    
    (newline)
    (display "base = ")
    (display base)
    (display "; exp = ")
    (display exp)
    (display "; mod = ")
    (display mod)
    (start-expmod-test expmod-slow (runtime))
    (start-expmod-test expmod (runtime))
)

(check-equal? (expmod-slow 123 1568754 7) (expmod 123 1568754 7))

; (timed-expmod-test 123 1568754 7)
; (timed-expmod-test 2 3 5)

; при больших числах base^exp expmod-slow будет работать медленнее, потому что получение остатка от большого числа
; занимает много времени. В expmod остаток вычисляется на каждой итерации, из за этого вычисление остатков на более
; маленьких числах.
; Ниже замер времени:
; base = 123; exp = 1568754; mod = 7; #<procedure:expmod-slow> = 3098748; #<procedure:expmod> = 2
; base = 2; exp = 3; mod = 5; #<procedure:expmod-slow> = 1; #<procedure:expmod> = 1
