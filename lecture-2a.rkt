; Exercise 1.29.  Simpson's Rule is a more accurate method of numerical
; integration than the method illustrated above. Using Simpson's Rule, the
; integral of a function f between a and b is approximated as
;
; .
; 
; where h = (b - a)/n, for some even integer n, and yk = f(a + kh). (Increasing
; n increases the accuracy of the approximation.) Define a procedure that takes
; as arguments f, a, b, and n and returns the value of the integral, computed
; using Simpson's Rule. Use your procedure to integrate cube between 0 and 1
; (with n = 100 and n = 1000), and compare the results to those of the integral
; procedure shown above.

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (kth-term k)
    (define coefficient
      (cond ((zero? k) 1)
            ((= k n) 1)
            ((even? k) 2)
            (#t 4)))
    (* coefficient (y k)))
  (* (/ h 3) (sum kth-term 0 inc n)))

(list
 (simpsons cube 0 1 5)
 (simpsons cube 0 1 10)
 (simpsons cube 0 1 100)
 (simpsons cube 0 1 1000))


; Exercise 1.30.  The sum procedure above generates a linear recursion. The
; procedure can be rewritten so that the sum is performed iteratively. Show how
; to do this by filling in the missing expressions in the following definition:
; 
; (define (sum term a next b)
;   (define (iter a result)
;     (if <??>
;         <??>
;         (iter <??> <??>)))
;   (iter <??> <??>))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(list
 (= (sum identity 1 inc 10) 55)
 (= (sum (lambda (x) (* 2 x)) 1 inc 3) 12))


; Exercise 1.31
; 
; a.  The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures. Write an
; analogous procedure called product that returns the product of the values of a
; function at points over a given range. Show how to define factorial in terms
; of product. Also use product to compute approximations to  using the formula52
;
; .
; 
; b.  If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

;; recursive
(define (product2 term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; iterative
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(list
 (= 6 (product identity 1 inc 3))
 (= 384 (product (lambda (x) (* x 2)) 1 inc 4)))


; Exercise 1.31
; 
; a.  The sum procedure is only the simplest of a vast number of similar
; abstractions that can be captured as higher-order procedures. Write an
; analogous procedure called product that returns the product of the values of a
; function at points over a given range. Show how to define factorial in terms
; of product. Also use product to compute approximations to  using the formula
;
; .
; 
; b.  If your product procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

;; recursive
(define (product2 term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; iterative
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(list
 (= 6 (product identity 1 inc 3))
 (= 384 (product (lambda (x) (* x 2)) 1 inc 4)))


;; check pi
(define (evens k)
  (* 2 (floor (/ ( + 2 k) 2))))
(define (odds k)
  (+ 1 (* 2 (floor (/ (+ k 1) 2)))))

(define (pi a b)
  (* 4
     (/ (product evens a inc b)
        (product odds a inc b))))

(* 1.0 (pi 1 100000))


; Exercise 1.32
; a. Show that sum and product (exercise 1.31) are both special cases of a still
; more general notion called accumulate that combines a collection of terms,
; using some general accumulation function:
; 
; (accumulate combiner null-value term a next b)
; 
; Accumulate takes as arguments the same term and range specifications as sum
; and product, together with a combiner procedure (of two arguments) that
; specifies how the current term is to be combined with the accumulation of the
; preceding terms and a null-value that specifies what base value to use when
; the terms run out. Write accumulate and show how sum and product can both be
; defined as simple calls to accumulate.
; 
; b. If your accumulate procedure generates a recursive process, write one that
; generates an iterative process. If it generates an iterative process, write
; one that generates a recursive process.

;;; Exercise 1.32

(define (accumulator-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulator-recursive combiner null-value term (next a) next b))))

(define (accumulator-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(= 24 (accumulator-iterative * 1 identity 1 inc 4))



; Exercise 1.44.  The idea of smoothing a function is an important concept in
; signal processing. If f is a function and dx is some small number, then the
; smoothed version of f is the function whose value at a point x is the average
; of f(x - dx), f(x), and f(x + dx). Write a procedure smooth that takes as
; input a procedure that computes f and returns a procedure that computes the
; smoothed f. It is sometimes valuable to repeatedly smooth a function (that is,
; smooth the smoothed function, and so on) to obtained the n-fold smoothed
; function. Show how to generate the n-fold smoothed function of any given
; function using smooth and repeated from exercise 1.43.


