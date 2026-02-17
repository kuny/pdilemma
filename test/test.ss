(import (chezscheme)
        (pdilemma util))

(define (assert-equal a b msg)
  (unless (equal? a b)
    (error msg a b)))

(assert-equal (first '(a b)) 'a "expect a")
(assert-equal (second '(a b)) 'b "expect b")

; (let-values ([(a b) (payoff 'C 'C)])
  ; (assert-equal a 3 "C,C score A")
  ; (assert-equal b 3 "C,C score B"))

(display "OK\n")


