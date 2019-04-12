#lang sicp

;;;; Arch Lisp - April 11, 2019
;;;; SICP Lecture 5A
;;;; https://www.youtube.com/watch?v=jl8EHP1WrWY
;;;; Text Sections 3.1, 3.2
;;;; (p. 294 in sicp.pdf)
;;;; `C-c C-z` to launch your REPL from one of the rkt files.
;;;; `C-c C-k` to compile and load your file in the repl.
;;;; `C-x C-e` will evaluate the form and show it in the debug buffer.
;;;; Geiser Cheat Sheet: http://www.nongnu.org/geiser/geiser_5.html

;;; Exercise 3.1

(define hey-there 1234)

(define (make-accumulator n)
  (let ((a n))
    (lambda (x)
      (set! a (+ a x))
      a)))

(define a1 (make-accumulator 5))
(a1 10)
(a1 10)
