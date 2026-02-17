(library (pdilemma util)
  (export first 
          second 
          flatten
          transpose)
  (import (chezscheme))
	
  (define (first lst)
    (car lst))

  (define (second lst)
    (car (cdr lst)))
		
  (define (flatten x)
    (let rec ((x x) (acc '()))
      (cond ((null? x) acc)
            ((atom? x) (cons x acc))
            (else (rec
                    (car x)
                    (rec (cdr x) acc))))))

  (define (transpose x)
    (let ((flatten-x (flatten x)))
      flatten-x))


)
