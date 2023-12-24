#lang sicp

(#%require rackunit)

(define (sum term a next b)
    (if (> a b)
        0
        (+ (term a) (sum term (next a) next b))
    )
)

(define (integral-simpson f a b n)
    (define h (/ (- b a) n))
    (define (add-2h x) (+ x h h))
    (* 
        (/ h 3)
        (+ 
            (f a)
            (* 4 (sum f (+ a h) add-2h b))
            (* 2 (sum f (+ a h h) add-2h b))
            (f (+ a (* n h)))
        )
    )
)

(define (cube x) (* x x x))

(define (inc a) (+ a 1))

(define (sum-int a b)
    (sum identity a inc b)
)

(check-equal? (sum-int 1 2) 3)
(check-equal? (sum-int 1 3) 6)
(check-equal? (cube 2) 8)
(check-= (integral-simpson cube 0 1 1000) 0.25 0.01)
