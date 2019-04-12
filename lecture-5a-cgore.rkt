#lang sicp

;;;; Arch Lisp - April 11, 2019
;;;; SICP Lecture 5A
;;;; https://www.youtube.com/watch?v=jl8EHP1WrWY
;;;; Text Sections 3.1, 3.2
;;;; (p. 294 in sicp.pdf)
;;;; `C-c C-z` to launch your REPL from one of the rkt files.
;;;; `C-c C-k` to compile and load your file in the repl.
;;;; `C-x C-e` will evaluate the form and show it in the debug buffer.
;;;; `C-c C-c` will evaluate the form and show in the Emacs gutter.
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

;;; Exercise 3.2

(define (make-monitored f)
  (let ((a (make-accumulator 0)))
    (lambda rest
      (if (eq? 'how-many-calls? (car rest))
          (a 0)
          (begin
            (a 1)
            (apply f rest))))))
