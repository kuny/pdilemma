
; (library-directories '("src"))

(import (chezscheme)
        (pdilemma util))

; (define actions '(cooperate defect))
(define cooperate 'cooperate)
(define defect 'defect)
(define actions (list cooperate defect))

(define payoff-matrix '((3 3) (0 5)
                        (5 0) (1 1)))

(define (payoff p1-action p2-action)
  (cond ((and (eq? p1-action cooperate)
              (eq? p2-action cooperate)) '(3 3))
        ((and (eq? p1-action cooperate)
              (eq? p2-action defect)) '(0 5))
        ((and (eq? p1-action defect)
              (eq? p2-action cooperate)) '(5 0))
        ((and (eq? p1-action defect)
              (eq? p2-action defect)) '(1 1))
        (t (error 'payoff "Unknown actions ~a ~a" p1-action p2-action))))

(define (p1-utility p1-action p2-action)
  (first (payoff p1-action p2-action)))

(define (p2-utility p1-action p2-action)
  (second (payoff p1-action p2-action)))

(display (flatten payoff-matrix))
