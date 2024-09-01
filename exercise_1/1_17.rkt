#lang racket

; The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:

(define (mul a b)
  (if (= b 0) 0 (+ a (mul a (- b 1)))))

; This algorithm takes a number of steps that is linear in b. Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-mul base now_d)
  (cond
    [(= now_d 0) 0]
    [(even? now_d) (double (fast-mul base (halve now_d)))]
    [(odd? now_d) (+ base (fast-mul base (- now_d 1)))]))

(fast-mul 0 1)
(fast-mul 1 0)
(fast-mul 3 4)
