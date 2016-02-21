(define (make-account balance password)
  (define fail-count 0)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
      balance)
  (define (call-the-cops) (lambda (x) "Cops coming"))
  (define (dispatch m pwd)
    (cond ((not (eq? pwd password)) 
	   (set! fail-count (+ fail-count 1))
	   (if (>= fail-count 7)
	     (call-the-cops) 
	     (lambda (x) "Incorrect password")))
	  ((eq? m 'withdraw) (set! fail-count 0) withdraw)
	  ((eq? m 'deposit) (set! fail-count 0) deposit)
	  (else (error "Unknown request -- MAKE-ACCOUNT" m ))))
  dispatch)

(define acc (make-account 100 'key))
(newline)
(display ((acc 'withdraw 'key) 50))
; 50

((acc 'withdraw 'wrongkey) 50)
((acc 'withdraw 'wrongkey) 50)
((acc 'withdraw 'wrongkey) 50)
((acc 'withdraw 'wrongkey) 50)
((acc 'withdraw 'wrongkey) 50)
(newline)
(display ((acc 'withdraw 'wrongkey) 50))
; "Incorrect password"
(newline)
(display ((acc 'withdraw 'wrongkey) 50))
; "Cops coming"