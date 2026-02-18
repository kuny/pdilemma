(library (pdilemma core)
  (export cooperate
          defect
          player1
          player2
          player1-payoff
          player2-payoff
          payoff)
  (import (chezscheme)
          (atelier-kame util)
          (pdilemma util))


  (define cooperate 0)
  (define defect 1)
  (define player1 'player1)
  (define player2 'player2)

  (define payoff-matrix
    (call-with-input-file "src/payoff.scm"
                          (lambda (p) (read p))))

  (define p1-matrix payoff-matrix)
  (define p2-matrix (transpose payoff-matrix))

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

  (define (player1-payoff my-action opponent-action)
    (payoff player1 my-action opponent-action))

  (define (player2-payoff my-action opponent-action)
    (payoff player2 my-action opponent-action))


  )
