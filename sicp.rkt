;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname sicp) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; calculate fibonacci number
(define (fib_user n)
  (fib_iter_user 1 0 n))
(define (fib_iter_user a b count)
    (if (= count 0)
        b
        (fib_iter_user (+ a b) a (- count 1))))
; import fibonacci()
(require math/number-theory)

; list-ref
(define (list_ref_user items n)
  (if (= n 0)
      (car items)
      (list_ref_user (cdr items) (- n 1))))
(list_ref_user (list 1 4 9 16 25) 4)
(list_ref_user (list 1 4 9 16 25) 0)
; list-length
(define (length_user items) 
  (length_iter_user items 0))
(define (length_iter_user items count)
    (if (null? items)
        count
        (length_iter_user (cdr items) (+ 1 count))))
(length_user (list 1 2 3 4 5))

; solution 2.17
(define (last_pair_user items)
  (if (= (length items) 1)
      (car items)
        (last_pair_user (cdr items))))
(last_pair_user (list 1 2 3 4))
(last_pair_user (cons '() '()))
(last_pair_user (list 1 '()))

; solution 2.18
(define (reverse_user items)
  (reverse_iter_user items (- (length items) 1)))
(define (reverse_iter_user items n)
  (if (= n -1)
      '()
      (cons (list_ref_user items n) (reverse_iter_user items (- n 1)))))
(reverse_user (list 1 2 3 4))