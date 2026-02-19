(library (pdilemma view)
  (export title
          print-games
          please-select
          print-result)
  (import (chezscheme))


  (define (title)
      (newline)
      (display "🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢\n\n")

      (display "     Prisoner's Dilemma\n\n")
      
      (display "🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢\n\n")
      )

  (define (print-games games n)
    (cond ((null? games) #t)
          (else
            (display (string-append (number->string n) ": " (car games) "\n"))
            (print-games (cdr games) (+ n 1)))))

  (define (please-select)
    (display "\nplease select a game file: "))

  (define (print-result lst)
    (newline)
    (display "result: ")
    (display lst)
    (newline)
    (newline))

)
