#lang sicp

(#%require rackunit)

(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))
    )
)

(check-equal? (gcd 206 40) 2)

#| 
Нормальный порядок вычисления
1. (gcd 206 40)
2. (gcd 40 (remainder 206 40))
3. (gcd 
        (remainder 206 40)
        (remainder
            40 
            (remainder 206 40)
        )
    )
4. (gcd
        (remainder
            40
            (remainder 206 40)
        )
        (remainder
            (remainder 206 40)
            (remainder
                40
                (remainder 206 40)
            )
        )
    )
5. (gcd 
        (remainder
            (remainder 206 40)
            (remainder
                40
                (remainder 206 40)
            )
        )
        (remainder
            (remainder
                40
                (remainder 206 40)
            )
            (remainder
                (remainder 206 40)
                (remainder
                    40
                    (remainder 206 40)
                )
            )
        )
    )
6. (remainder
        (remainder 206 40)
        (remainder
            40
            (remainder 206 40)
        )
    )
7. (remainder
        (remainder 206 40)
        (remainder 40 6)
    )
8. (remainder 6 4)
9. 2
Количество remainder: 29

Аппликативный порядок
1. (gcd 206 40)
2. (gcd 40 (remainder 206 40))
3. (gcd 40 6)
4. (gcd 6 (remainder 40 6))
5. (gcd 6 4)
6. (gcd 4 (remainder 6 4))
7. (gcd 4 2)
8. (gcd 2 (remainder 4 2))
9. (gcd 2 0)
10. 2
Количество remainder: 4
|#