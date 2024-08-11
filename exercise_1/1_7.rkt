#lang racket

;Exercise 1.7.
;The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (old-sqrt-iter guess x)
  (if (old-good-enough1? guess x)
      guess
      (old-sqrt-iter (old-improve guess x) x)))

(define (old-improve guess x)
  (average guess (/ x guess)))

(define (old-good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (old-good-enough1? guess x)
  (< (abs (- guess (/ x guess))) (* 0.001  guess)))

(define (old-sqrt x)
  (old-sqrt-iter 1.0 x))

; ; test fails for small numbers
; Insufficient accuracy of the result
(old-sqrt 0.00009)

; ; test fails for large numbers
; ; time exceeded
; 因为 lisp 实现的小数精度不足以表示两个大数之间的差，所以 sqrt 会陷入死循环而无法得出正确结果。
(define y (old-sqrt 4598347981248908098))
(println y)
(square y)

(define (sqrt-iter pre guess x)
  (if (good-enough? pre guess)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough-1? pre guess)
  (< (abs (- pre guess)) 0.00000000001))

(define (good-enough-2? pre guess)
  (< (/ (abs (- pre guess)) pre) 0.00001))

(define good-enough? good-enough-1?)

(define (sqrt x)
  (sqrt-iter 0.0 1.0 x))

(sqrt 9)
; good-enough-1 3.000000001396984
; good-enough-2 3.00009155413138

; test for small numbers
;
(sqrt 0.00009)
; good-enough-1 0.009487978730289174
; good-enough-2 0.009486833049684392

; test for large numbers
(sqrt 4598347981248908098)
; good-enough-1 2144375895.5110712
; good-enough-2 2144376367.0839047

(define x (sqrt 4598347981248908098))
(println x)
(square x)
; good-enough-1 4598347981248909000
; good-enough-2 4598350003707965400