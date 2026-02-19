
; (library-directories '("src"))

(import (chezscheme)
        (rnrs)
        (pdilemma core)
        (pdilemma strategy))

(define p1 'maxmini)
(define p2 'maxmini)

(define (get-games)
  (filter (lambda (filename)
            (let ([len (string-length filename)])
              (and (> len 3)
                   (string=? (substring filename (- len 4) len) ".scm"))))
          (directory-list "./data")))

(define (read-select)
  (let ((input (get-line (current-input-port))))
    (- (string->number input) 1)))

(define (select-game)
  (let ((games (get-games)))
    (letrec ((print-games 
               (lambda (games n)
                 (cond ((null? games) #t)
                       (else
                         (display (string-append (number->string n) ": " (car games)))
                         (newline)
                         (print-games (cdr games) (+ n 1)))))))
      (print-games games 1)
      (display "please select a game file: ")
      (flush-output-port (current-output-port))
      (string-append "./data/" 
                     (list-ref games 
                               (read-select))))))

(initialize-game (select-game))
(newline)
(let ((p1-action (strategy player1 p1))
      (p2-action (strategy player2 p2)))
  (display (play player1 p1-action p2-action))
  (newline))



