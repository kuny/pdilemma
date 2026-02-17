(library (pdilemma util)
  (export first second)
  (import (chezscheme))

  (define (first lst)
    (car lst))

  (define (second lst)
    (car (cdr lst))))
