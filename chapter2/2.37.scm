(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence)
	(accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    nil
    (cons (accumulate op init (map car seqs))
	  (accumulate-n op init (map cdr seqs)))))

(define matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v))
	 m))
(newline)
(display (matrix-*-vector matrix (list 1 2 3 4)))

(define (transpose mat)
  (accumulate-n cons nil mat))

(newline)
(display (transpose matrix))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(newline)
(display (matrix-*-matrix matrix matrix) )

