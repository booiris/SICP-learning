#lang racket

(define (factorial1 n)
  (if ( = n 1) 1 ( * n (factorial1 (- n 1))) )
  )

(factorial1 6)

; (define (factorial2 n)
; ;   (if ( = n 1) 1 ( * n (factorial (- n 1))) )
;   )

(define (factorial2 n)
  (factorial-iter 1 1 n)
  )

(define (factorial-iter res now max-iter-count)
  (if (= now max-iter-count) (* res now) ( factorial-iter (* res now) (+ now 1) max-iter-count ) )
  )

(factorial2 6)
; (factorial1 6)