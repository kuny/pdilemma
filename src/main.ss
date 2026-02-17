
; (library-directories '("src"))

(import (chezscheme)
        (pdilemma util))

; (define actions '(cooperate defect))
(define cooperate 0)
(define defect 1)
(define actions (list 'cooperate 'defect))

(define payoff-matrix '(((3 3) (0 5))
                        ((5 0) (1 1))))

(define (payoff p1-action p2-action)
  (cond ((and (or (= p1-action cooperate)
                  (= p1-action defect))
              (or (= p2-action cooperate)
                  (= p2-action defect)))
         (list-ref 
           (list-ref payoff-matrix p1-action) p2-action))
        (t (error 'payoff "Unknown actions ~a ~a" p1-action p2-action))))
				
(modulo 10 3)

(display (payoff cooperate defect))
