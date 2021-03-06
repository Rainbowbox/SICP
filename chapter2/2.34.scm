(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) 
	(accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
		(+ this-coeff (* higher-terms x)))
	      0
	      coefficient-sequence))

(newline)
; 1 + 3x + 5x^3 + x^5
; when x = 2
(display (horner-eval 2 (list 1 3 0 5 0 1)))
