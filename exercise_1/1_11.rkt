#lang racket

;Exerice 1.11
; A function f if defined by the rule that

; fn(n) = {n if n<3, fn(n-1) + 2fn(n-2) + 3fn(n-3) if n>=3}

; Write a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative process.

(define d 10)

(define (cal1 n)
  (if (< n 3) n (+ (cal1 (- n 1)) (* 2 (cal1 (- n 2))) (* 3 (cal1 (- n 3))))))

(cal1 d)

(define (cal2 n)
  (cal2-iter 0 1 2 n))

(define (cal2-iter now next next_next count)
  (if (= count 0) now (cal2-iter next next_next (+ (* 3 now) (* 2 next) next_next) (- count 1))))

(cal2 d)
