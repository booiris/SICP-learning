(define (good_enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (average guess x)
    (/ (+ x guess) 2))

(define (improve guess x)
    (average guess (/ x guess)))

(define (sqrt_iter guess x)
    (if (good_enough? guess x)
        guess
        (sqrt_iter (improve guess x) x)))

(sqrt_iter 1.0 9)