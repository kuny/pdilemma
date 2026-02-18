(library (pdilemma core)
  (export cooperate
          defect
          player1
          player2
          select-game
          payoff
          payoff+
          utility)
  (import (chezscheme)
          (atelier-kame util)
          (pdilemma util))


  (define cooperate 0)
  (define defect 1)
  (define actions (list cooperate defect))

  (define player1 'player1)
  (define player2 'player2)

  (define (to-action-name action)
    (cond ((= action cooperate) 'cooperate)
          (else 'defect)))

  (define p1-matrix '()) 
  (define p2-matrix '())
  
  (define (select-game n)
    (set! p1-matrix
      (call-with-input-file (string-append "src/game" (number->string n) ".scm")
                            (lambda (p) (read p))))
    (set! p2-matrix (transpose p1-matrix)))


  (define (get-matrix player)
    (cond ((eq? player player1) p1-matrix)
          ((eq? player player2) p2-matrix)
          (else (error 'payoff "Unknown player ~a" player))))

  (define (payoff player my-action opponent-action)
    (cond ((and (or (= my-action cooperate) (= my-action defect))
                (or (= opponent-action cooperate) (= opponent-action defect)))
           (list-ref (list-ref (get-matrix player) my-action) opponent-action))
          (else
           (error 'payoff "Unknown actions ~a ~a" my-action opponent-action))))

  (define (payoff+ player my-action opponent-action)
    (let ((acts (list (to-action-name my-action) 
                      (to-action-name  opponent-action)))
          (po (payoff player my-action opponent-action)))
      (list acts po)))

  (define (utility player my-action opponent-action)
    (car (payoff player my-action opponent-action)))

  )
