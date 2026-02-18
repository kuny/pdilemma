
; (library-directories '("src"))

(import (chezscheme)
        (pdilemma util)
        (pdilemma core)
        (pdilemma strategy))

; (cond ((= (maxmini player1) 0) 
       ; (display "cooperate\n"))
      ; (else
        ; (display "defect")))

(select-game 2)
(let ((p1-action (maxmini player1))
      (p2-action (maxmini player2)))
  (display (payoff+ player1 p1-action p2-action))
  (newline))

#|
(display (payoff player1 cooperate defect))
(newline)

(display (payoff player1 defect cooperate))
(newline)

(display (utility player1 cooperate defect))
(newline)
|#

