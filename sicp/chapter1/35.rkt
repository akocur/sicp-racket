#lang sicp

(#%require rackunit)

(define (fixed-point f first-guess)
    (define tolerance 0.00001)

    (define (good-enough? value1 value2)
        (<= (abs (- value1 value2)) tolerance)
    )

    (define (try guess)
        (let ([next (f guess)])
            (if (good-enough? next guess)
                next
                (try next)
            )
        )
    )

    (try first-guess)
)

(define golden-ratio (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(check-= (fixed-point cos 1.0) 0.7390822985224023 0.00001)
(check-= golden-ratio 1.61803 0.00001)
