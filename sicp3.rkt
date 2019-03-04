(define (make-accumulator sum)
  (lambda (x) (begin (set! sum (+ sum x)) sum)))

(define A (make-accumulator 5))
(A 10)
(A 10)

(define random-init 100)
(define (rand-update x)
  (+ x 1))

(define rand_user
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(rand_user)
(rand_user)

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((tmp (cdr x)))
          (set-cdr! x y)
          (loop tmp x))))
  (loop x '()))
(define v (list 'a 'b 'c 'd))
(define w (mystery v))
