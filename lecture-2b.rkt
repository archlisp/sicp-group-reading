#lang sicp

;; http://sarabander.github.io/sicp/html/2_002e1.xhtml#g_t2_002e1

;; Exercise 2.1: Define a better version of make-rat that handles both positive
;; and negative arguments. Make-rat should normalize the sign so that if the
;; rational number is positive, both the numerator and denominator are positive,
;; and if the rational number is negative, only the numerator is negative.


(define (make-rat-v1 n d)
  (let ((g (gcd n d)))
    (cons (/ n g) 
          (/ d g))))

(define (make-rat-v2 n d)
  (let* ((g (gcd n d))
         (num (/ n g))
         (den (/ d g)))
    (if (negative? den)
        (cons (* -1 num) (* -1 den))
        (cons num den))))

;; Exercise 2.2: Consider the problem of representing line segments in a
;; plane. Each segment is represented as a pair of points: a starting point and
;; an ending point. Define a constructor make-segment and selectors
;; start-segment and end-segment that define the representation of segments in
;; terms of points. Furthermore, a point can be represented as a pair of
;; numbers: the x coordinate and the y coordinate. Accordingly, specify a
;; constructor make-point and selectors x-point and y-point that define this
;; representation. Finally, using your selectors and constructors, define a
;; procedure midpoint-segment that takes a line segment as argument and returns
;; its midpoint (the point whose coordinates are the average of the coordinates
;; of the endpoints). To try your procedures, you’ll need a way to print points:

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-point x y)
  (cons x y))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

(define (make-segment start end)
  (cons start end))

(define (average x y)
  (/ (+ x y) 2))

(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment   segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment   segment)))))
