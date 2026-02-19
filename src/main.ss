
; (library-directories '("src"))

(import (chezscheme)
        (rnrs)
        (pdilemma view)
        (pdilemma core)
        (pdilemma strategy))

(define p1 'maxmini)
(define p2 'maxmini)
(define games (get-games))

(define (read-input)
  (please-select)
  (let ((input (get-line (current-input-port))))
    (- (string->number input) 1)))

(define (select-game)
  (string-append "./data/" 
                 (list-ref games 
                           (read-input))))

(define (main)
  (title)
  (print-games games 1)
  (initialize-game (select-game))
  (newline)
  (let ((p1-action (strategy player1 p1))
        (p2-action (strategy player2 p2)))
    (play player1 p1-action p2-action show-result)
    (newline)))

(main)

