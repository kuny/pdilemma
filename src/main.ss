
; (library-directories '("src"))

(import (chezscheme)
        (pdilemma util))

; (define actions '(cooperate defect))
(define cooperate 0)
(define defect 1)
(define actions (list 'cooperate 'defect))
(define player1 'player1)
(define player2 'plalyer2)

(define payoff-matrix '(((3 3) (0 5))
                        ((5 0) (1 1))))

(define (payoff player my-action opponent-action)
  (letrec* ((get-matrix
              (lambda (player mtrx)
                (if (equal? player player1)
                  mtrx
                  (transpose mtrx)))))
    (cond ((and (or (= my-action cooperate)
                  (= my-action defect))
              (or (= opponent-action cooperate)
                  (= opponent-action defect)))
           (list-ref 
             (list-ref (get-matrix player payoff-matrix) my-action) opponent-action))
          (else 
            (error 'payoff "Unknown actions ~a ~a" my-action opponent-action)))))
				
(display (payoff player1 cooperate defect))
(newline)
(display (payoff player2 cooperate defect))
(newline)
