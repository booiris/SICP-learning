#lang racket

; Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt. (Hint: Using the observation that (b^(n/2))^2=(b^2)^(n/2), keep, along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product (ab)^n is unchanged from state to state. At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process. In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

(define (exp a b)
  (exp-iter 1 a b))

(define (exp-iter res base now_d)
  (cond
    [(= now_d 0) res]
    [[even? now_d] [exp-iter res (* base base) (/ now_d 2)]]
    [[odd? now_d] [exp-iter (* res base) base (- now_d 1)]]))

(exp 3 0)
(exp 4 1)
(exp 3 2)
(exp 3 5)
