;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname sicp) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
; solution 2.21
(define (square_list items)
  (if (null? items)
      '()
      (cons (sqr (car items)) (square_list (cdr items)))))
(square_list (list 1 2 3 4))

; solution 2.23
(define (for_each proc items)
  (if (= (length items) 1)
      (proc (car items))
      (void (proc (car items)) (for_each proc (cdr items)))))
(for_each sqr (list 1 2 3 4))
(for_each (lambda (x) (void (newline) (display x))) (list 1 2 3 4))
(newline)

; accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))
(define (append_user seq1 seq2)
  (accumulate cons seq2 seq1))
(define (map_user proc sequence)
  (accumulate (lambda (x y) (if (equal? '() y) (cons (proc x) '()) (cons (proc x) y))) '() sequence))
(define (length_user sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))
(append_user (list 1 2) (list 3 4))
(map_user sqr (list 1 2 3 4))
(length_user (list 1 2 3 4))
(accumulate + 0 (list 1 2 3 4))