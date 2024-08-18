#lang racket

; The following pattern of numbers is called Pascal’s triangle.

;          1
;        1   1
;      1   2   1
;    1   3   3   1
;  1   4   6   4   1
;        . . .

; The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it. Write a procedure that computes elements of Pascal’s triangle by means of a recursive process.

; f(1, 1) = 1, f(2, 1) = 1, f(2, 2) = 1

(define (cal i j)
  (cond
    [(= i j) 1]
    [(= j 1) 1]
    [else (+ (cal (- i 1) (- j 1)) (cal (- i 1) j))]))

(cal 1 1)
(cal 2 2)
(cal 2 1)
(cal 3 2)
(cal 4 4)
(cal 5 4)
(cal 5 3)

