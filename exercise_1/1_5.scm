;Exercise 1.5
;Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))


;normal-order： 执行 test 0 (p) 时，参数 0 和 (p) 都会被求值， 此时 (p) 被执行，进入死循环
;applicative-order： 需要时才会计算， 所以不会计算 (p), 不会进入死循环