(define (element-of-set? x set)
  (cond ((null? set) false)
	((= x (car set)) true)
	((< x (car set)) false)
	(else (element-of-set? x (cdr set)))))

(newline)
(display (element-of-set? 4 '(1 2 4 8 9)))
; true

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2)) 
    '()
    (let ((x1 (car set1))
	  (x2 (car set2)))
      (cond ((= x1 x2)
	     (cons x1
		   (intersection-set (cdr set1) (cdr set2))))
	    ((< x1 x2)
	     (intersection-set (cdr set1) set2))
	    ((> x1 x2)
	     (intersection-set set1 (cdr set2)))))))


(newline)
(display (intersection-set '(1 2 3 5) '(2 3 4)))
; (2 3)
