(define the-empty-stream '())

(define (stream-ref s n)
  (if (= n 0)
    (stream-car s)
    (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
    the-empty-stream 
    (cons-stream (proc (stream-car s))
                 (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
    'done
    (begin (proc (stream-car s))
           (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))

(define (cons-stream a b) (cons a (delay b)))
(define (stream-car stream) (car stream))
(define (stream-cdr stream) (force (cdr stream)))
(define (stream-null? s) (null? s))

(define (stream-enumerate-interval low high)
  (if (> low high)
    the-empty-stream
    (cons-stream
      low 
      (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) the-empty-stream)
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred
                                     (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))

(define (force delayed-object)
  (delayed-object))

(define (memo-proc proc)
  (let ((already-run? false) (result false))
    (lambda()
      (if (not already-run?)
        (begin (set! result (proc))
               (set! already-run? true)
               result)
        result))))
(define (delay expression)
  (lambda()
    expression))

(define (stream-map-args proc . argstreams)
  (if (stream-null? (car argstreams))
    the-empty-stream
    (cons-stream
      (apply proc (map stream-car argstreams))
      (apply stream-map-args
             (cons proc (map stream-cdr argstreams))))))

(define (inc s i)
  (+ s i))

(define (inc1 s)
  (+ s 1))

(define interval (stream-enumerate-interval 101 110))
(newline)
(define interval2 (stream-map inc1 interval))
(display-stream interval2)

(define interval3 (stream-map-args + interval interval2))
(newline)
(display "stream-map-args")
(display-stream interval3)
