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

(assert-equal (flatten
                '((1 2) (3 4)
                  (5 6) (7 8)))
                '(1 2 3 4 5 6 7 8)
                "expect (1 2 3 4 5 6 7 8)")

(assert-equal (transpose 
                '((1 2) (3 4)
                  (5 6) (7 8)))
                '((2 1) (6 5)
                  (4 3) (8 7))
                "expect ((2 1) (6 5) (4 3) (8 7))")

(display "OK\n")


