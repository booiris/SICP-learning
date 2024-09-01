#lang racket

; Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-mul a b)
  (fast-mul-iter 0 a b))

(define (fast-mul-iter res base now_d)
  (cond
    [(= now_d 0) res]
    [(even? now_d) (fast-mul-iter res (double base) (halve now_d))]
    [(odd? now_d) (fast-mul-iter (+ res base) base (- now_d 1))]))

(fast-mul 0 1)
(fast-mul 1 0)
(fast-mul 3 4)
