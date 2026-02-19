(library (pdilemma strategy)
  (export maxmini
          maxmax
          strategy)
  (import (chezscheme)
          (atelier-kame util)
          (pdilemma util)
          (pdilemma core))

  (define (min-utility player my-action)
    (let ((cu (utility player my-action cooperate))
          (du (utility player my-action defect)))
      (cond ((< cu du) cu)
            (else du))))

  (define (max-utility player my-action)
    (let ((cu (utility player my-action cooperate))
          (du (utility player my-action defect)))
      (cond ((> cu du) cu)
            (else du))))

  (define (maxmini player)
    (let ((cmin (min-utility player cooperate))
          (dmin (min-utility player defect)))
      (cond ((> cmin dmin) cooperate)
            (else defect))))

  (define (maxmax player)
    (let ((cmax (max-utility player cooperate))
          (dmax (max-utility player defect)))
      (cond ((> cmax dmax) cooperate)
            (else defect))))
  
  (define (strategy player choice)
    (cond ((eq? choice 'maxmini) (maxmini player))
          ((eq? choice 'maxmax) (maxmax player))
          (else
            (error 'strategy "Unknown choice ~a ~a" player choice))))

)
