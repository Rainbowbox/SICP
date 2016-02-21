(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
      balance)
  (define (dispatch m pwd)
    (cond ((not (eq? pwd password)) 
	   (lambda (x) "Incorrect password"))
	  ((eq? m 'withdraw) withdraw)
	  ((eq? m 'deposit) deposit)
	  (else (error "Unknown request -- MAKE-ACCOUNT" m ))))
  dispatch)

(define acc (make-account 100 'key))
(newline)
(display ((acc 'withdraw 'key) 50))
; 50

(newline)
(display ((acc 'withdraw 'wrongkey) 60))
; "Incorrect password"