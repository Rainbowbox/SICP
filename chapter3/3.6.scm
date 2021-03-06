(define random-init 0)
(define (rand-update x) (+ x 1))

(define rand
  (let ((x random-init))
    (define (dispatch message)
      (cond ((eq? message 'generate)
	     (set! x (rand-update x))
	     x)
	    ((eq? message 'reset)
	     (lambda (new-value) (set! x new-value)))))
    dispatch))

(newline)
(display (rand 'generate))
(newline)
(display (rand 'generate))
(newline)
(display ((rand 'reset) 0))
(newline)
(display (rand 'generate))
