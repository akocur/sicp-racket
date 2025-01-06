#lang sicp

(#%require rackunit)

(define (fixed-point f first-guess)
    (define tolerance 0.00001)

    (define (good-enough? value1 value2)
        (<= (abs (- value1 value2)) tolerance)
    )

    (define (print-step step value)
        (newline)
        (display "step ")
        (display step)
        (display ": ")
        (display value)
    )

    (define (try guess step)
        (print-step step guess)
        (let ([next (f guess)])
            (if (good-enough? next guess)
                (print-step (+ step 1) next)
                (try next (+ step 1))
            )
        )
    )

    (try first-guess 1)
    (newline)
)

(define (average a b) (/ (+ a b) 2))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
(newline)
(display "Торможение усреднением:")
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)

#|step 1: 2.0
step 2: 9.965784284662087
step 3: 3.004472209841214
step 4: 6.279195757507157
step 5: 3.759850702401539
step 6: 5.215843784925895
step 7: 4.182207192401397
step 8: 4.8277650983445906
step 9: 4.387593384662677
step 10: 4.671250085763899
step 11: 4.481403616895052
step 12: 4.6053657460929
step 13: 4.5230849678718865
step 14: 4.577114682047341
step 15: 4.541382480151454
step 16: 4.564903245230833
step 17: 4.549372679303342
step 18: 4.559606491913287
step 19: 4.552853875788271
step 20: 4.557305529748263
step 21: 4.554369064436181
step 22: 4.556305311532999
step 23: 4.555028263573554
step 24: 4.555870396702851
step 25: 4.555315001192079
step 26: 4.5556812635433275
step 27: 4.555439715736846
step 28: 4.555599009998291
step 29: 4.555493957531389
step 30: 4.555563237292884
step 31: 4.555517548417651
step 32: 4.555547679306398
step 33: 4.555527808516254
step 34: 4.555540912917957
step 35: 4.555532270803653

Торможение усреднением:
step 1: 2.0
step 2: 5.9828921423310435
step 3: 4.922168721308343
step 4: 4.628224318195455
step 5: 4.568346513136242
step 6: 4.5577305909237005
step 7: 4.555909809045131
step 8: 4.555599411610624
step 9: 4.5555465521473675
step 10: 4.555537551999825
|#