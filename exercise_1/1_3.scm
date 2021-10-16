;Exercise 1.3.  
;Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers

; (define (sum_squares_two_larger_numbers x y z)
;     (- (+ (* x x) (* y y) (* z z))
;         (* (min x y z) (min x y z))))

(define (sum_squares_two_larger_numbers x y z)
    (cond 
        ((and (< x y) (< x z)) (+ (* y y) (* z z)))
        ((and (< y x) (< y z)) (+ (* x x) (* z z)))
        ((and (< z x) (< z y)) (+ (* x x) (* y y)))))

(sum_squares_two_larger_numbers 1 2 10)