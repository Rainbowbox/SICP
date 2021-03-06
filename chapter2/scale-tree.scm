(define nil '())
(define (scale-tree tree factor)
  (cond ((null? tree) nil)
	((not (pair? tree)) (* tree factor))
	(else (cons (scale-tree (car tree) factor)
		    (scale-tree (cdr tree) factor)))))

(newline)
(display (scale-tree (list 1 (list 2 (list 3 4 (list 5) (list 6 7)))) 10))
; (10 (20 (30 40) 50) (60 70))


(define (map-tree tree factor)
  (map (lambda (sub-tree)
	 (if (pair? sub-tree)
	   (map-tree sub-tree factor)
	   (* sub-tree factor)))
       tree))

(newline)
(display (map-tree (list 1 (list 2 (list 3 4 (list 5) (list 6 7)))) 10))
; (10 (20 (30 40) 50) (60 70))
