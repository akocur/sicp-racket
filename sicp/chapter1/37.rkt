#lang sicp

(#%require rackunit)

(define (cont-fract-recursive n d k)
    (define (cont-fract-recur i)
        (if (= i k)
            (/ (n i) (d i))
            (/ (n i) (+ (d i) (cont-fract-recur (inc i))))))
    (cont-fract-recur (min 1 k)))

(define (cont-fract-iterative n d k)
    (define (cont-fract-iter i r)
        (if (<= i 0)
            r
            (cont-fract-iter (dec i) (/ (n i) (+ (d i) r)))))
    (cont-fract-iter (dec k) (/ (n k) (d k))))

(define (print-step step value)
    (newline)
    (display "step ")
    (display step)
    (display ": ")
    (display value))

(define (find-k f n d r)
    (define tolerance 0.00001)
    (define (good-enough? value1 value2)
        (<= (abs (- value1 value2)) tolerance))
    (define (find-k-iter k)
        (let ([current-r (f n d k)])
            (print-step k current-r)
            (if (good-enough? current-r r)
                k
                (find-k-iter (inc k)))))
    (find-k-iter 1))

(find-k cont-fract-recursive (lambda (_) 1.0) (lambda (_) 1.0) (/ 1 1.61803))
(find-k cont-fract-iterative (lambda (_) 1.0) (lambda (_) 1.0) (/ 1 1.61803))

(check-equal?
    (cont-fract-recursive (lambda (_) 1.0) (lambda (_) 1.0) 3)
    (/ 2.0 3.0))
(check-equal?
    (cont-fract-iterative (lambda (_) 1.0) (lambda (_) 1.0) 3)
    (/ 2.0 3.0))

; step 1: 1.0
; step 2: 0.5
; step 3: 0.6666666666666666
; step 4: 0.6000000000000001
; step 5: 0.625
; step 6: 0.6153846153846154
; step 7: 0.6190476190476191
; step 8: 0.6176470588235294
; step 9: 0.6181818181818182
; step 10: 0.6179775280898876
; step 11: 0.6180555555555556
; step 12: 0.618025751072961312
