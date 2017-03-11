;; begin of question 1

;; the following is given by the question
(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;; the following is the def of cdr
(define (cdr z)
  (z (lambda (p q) q)))

;; check using substitution model
;(cdr (cons x y))
;(cdr (lambda (m) (m x y)))
;((lambda (m) (m x y)) (lambda (p q) q))
;((lambda (p q) q) x y)
;y
;which gives the right answer

;; end of question 1