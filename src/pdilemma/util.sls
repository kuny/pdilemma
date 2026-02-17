(library (pdilemma util)
  (export first second)
  (import (chezscheme))
	
  (define (first lst)
    (car lst))

  (define (second lst)
    (car (cdr lst)))
		
		
	(define (flatten lst)
    (let loop ((lst lst) (acc '()))
      (cond
        ((null? lst) (reverse acc))
        ((pair? (car lst))
         (loop (cdr lst)
             (loop (car lst) acc)))
        (else
         (loop (cdr lst)
             (cons (car lst) acc))))))
)
