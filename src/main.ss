
; (library-directories '("src"))

(import (chezscheme)
        (pdilemma util)
        (pdilemma core))
				
(display (player1-payoff cooperate defect))
(newline)

(display (player2-payoff defect cooperate))
(newline)
