(import (chezscheme)
        (pdilemma util))

(define (assert-equal a b msg)
  (unless (equal? a b)
    (error msg a b)))

(assert-equal (first '(a b)) 'a "expect a")
(assert-equal (second '(a b)) 'b "expect b")

(assert-equal (flatten '(1 (2) (3 (4)))) 
              '(1 2 3 4)
              "expect (1 2 3 4)")

(display "OK\n")


