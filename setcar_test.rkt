(define procedure-1 (lambda (x) (* x x)))

(define list1 (list 'a 'b))
(define list2 (list 'c 'd))
(define list3 (list 'e 'f))
(define exp1 (cons list1 list2))
(define exp2 (cons list3 (cdr exp1)))

(define (procedure-2 x y)
  (if (null? x)
      y
      (cons (car x) (procedure-2 (cdr x) y))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define z (append list1 list2))
(define w (append! list1 list2))