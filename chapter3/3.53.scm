(define (add-streams s1 s2)
  (stream-map + s1 s2))

(define s (cons-stream 1 (add-streams s s)))
; 1 2 4 8 ...
(newline)
(display (stream-car s))
(newline)
(display (stream-ref s 1))
(newline)
(display (stream-ref s 2))
(newline)
(display (stream-ref s 3))
(newline)
(display (stream-ref s 4))
