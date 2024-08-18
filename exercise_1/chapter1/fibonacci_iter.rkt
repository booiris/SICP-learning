#lang racket

(require racket/trace)

(define (fib n)
  (fib-iter 0 1 n))

(define (fib-iter now next count)
  (if (= count 0) now (fib-iter next (+ now next) (- count 1))))

(trace fib)

(fib 10)
