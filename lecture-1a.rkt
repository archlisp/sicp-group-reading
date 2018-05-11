#lang sicp

(define pi 3.14159265)

(* pi 2)

(define tau (* pi 2))

;;;; Exercise 1.1

10
(+ 5 3 4)
(- 9 1)
(/ 6 2)
(+ (* 2 4) (- 4 6))
(define a 3)
(define b (+ a 1))
(+ a b (* a b))
(= a b) ; #f is false, which is nil in Common Lisp
(if (and (> b a) (< b (* a b)))
    b ; <--- this one
    a)
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a)) ; <--- this one
      (else 25)) ; 16
(+ 2 (if (> b a) b a))
(* (cond ((> a b) a) ((< a b) b)
         (else -1)) (+ a 1))

;;;; Our burning questions ...
;;;; C-u C-x C-e evaluates into the buffer!

(+) ; 0
(*) ; 1
(/) ; kaboom
(-) ; kaboom
(not (not nil)) ; nil is something, truthy
(= nil '()) ; goes kaboom, not a number
(equal? nil '()) ; #t

(define (foo x)
  (+ 12 x))
(foo 123)
(define (bar x . r) ; r is the rest of the args as a list
  `(1 2 ,x 3 4 ,r)) ; backquote and friends (quasiquote)
(bar 10 11 12 13 14) ; {1 2 10 3 4 {11 12 13 14}}
(define (baaz x . r)
  `(1 2 ,x 3 4 ,@r))
(baaz 10 11 12 13 14) ; {1 2 10 3 4 11 12 13 14}
(define (quux x . r)
  `(1 2 ,(+ x 3))) ; #<void>
(quux 10) ; {1 2 13}
((λ (+ x 1)) 12) ; ERRORError: struct:exn:fail:contract:variable
(cons 1 2) ; {1 . 2}

;;;; Exercise 1.2

(/ (+ 5 4 (- 2 (- 3 (+ 6 4/5))))
   (* 3 (- 6 2) (- 2 7))) ; -37/150

;;;; Exercise 1.3

(define (foobar x)
  (define frobinated 12344)
  (+ frobinated x))
(foobar 12) ; 12356
frobinated ; kaboom

(define (sum-of-squares x y z)
  (define m (min x y z))
  (define (sos x y)
    (+ (* x x)
       (* y y)))
  (cond ((= x m) (sos y z))
        ((= y m) (sos x z))
        ((= z m) (sos x y))))
(sum-of-squares 1 2 3) ; 13
(sum-of-squares 2 3 1) ; 13
(list
 (sum-of-squares 3 4 5)
 (sum-of-squares 3 5 4)
 (sum-of-squares 5 3 4)
 (sum-of-squares 5 4 3)
 (sum-of-squares 4 3 5)
 (sum-of-squares 4 5 3)) ;  {41 41 41 41 41 41}
(sum-of-squares 12 12 12) ; 288

;;;; Exercise 1.3, round 2

(define (square x) (* x x))

(define (sum-of-squares2 x y) (+ (square x) (square y)))

(define (sum-of-largest-two x y z)
  (cond ((or (< x y z) (< x z y)) (sum-of-squares2 y z))
        ((or (< y x z) (< y z x)) (sum-of-squares2 x z))
        (else                     (sum-of-squares2 x y))))


;;;; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) ; pick the fn!
   a b))
(a-plus-abs-b 12 -3) ; 15

;;;; Exercise 1.5
;;;; don't run me

;;;; Exercise 1.6
;;;; also don't run me

;;;; Exercise 1.7
;;;; We need an epsilon that isn't hard-coded.

;;;; Exercise 1.8


