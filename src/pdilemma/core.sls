(library (pdilemma core)
  (export cooperate
          defect
          player1
          player2
          payoff)
  (import (chezscheme)
          (atelier-kame util)
          (pdilemma util))


  (define cooperate 0)
  (define defect 1)
  (define player1 'player1)
  (define player2 'player2)

  (define payoff-matrix '(((3 3) (0 5))
                        ((5 0) (1 1))))

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
	)
