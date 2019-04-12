#lang sicp

(define (equal?? x y)
  (or (eq? x y)
      (and (list? x) (list? y)
           (= (length x) (length y))
           (not (memq )))))

;; C-u C-x C-e will print the result in the buffer.

(equal?? 1 1)
(equal?? 1 2)
(equal?? '(this is a list)
         '(this is a list))
(equal?? '(this is a list)
         '(this (is a) list))

''x
