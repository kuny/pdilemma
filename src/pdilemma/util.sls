(library (pdilemma util)
  (export first 
          second 
          flatten
          transpose
          pair-up)
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

  (define (pair-up lst)
    (let loop ((lst lst) (acc '()))
      (if (null? lst)
        (reverse acc)
        (loop (cddr lst)
              (cons (list (car lst) (cadr lst)) acc)))))

  (define (extract-row x i n sz row)
    (cond ((= i (length x)) row)
          ((= (modulo i sz) n)
           (extract-row x (+ i 1) n sz (append row (list (reverse (list-ref x i))))))
          (else
            (extract-row x (+ i 1) n sz row))))

  (define (transpose x)
    (let* ((flatten-x (flatten x))
           (paired (pair-up flatten-x))
           (size (sqrt (length paired))))
      (letrec ((loop
                 (lambda (x n sz mtrx)
                   (cond ((= n sz) mtrx)
                         (else
                           (loop x 
                                 (+ n 1) 
                                 sz 
                                 (append mtrx (list (extract-row x  0 n sz '())))))))))
        (loop paired 0 size '()))))
                
                

)
