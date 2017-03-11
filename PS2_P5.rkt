;; Begin of question 5

;; To start on question 2.27, we first need to do 2.18
(define (reverse l1)
  (define (loop l1 result)
    (if (null? l1)
        result
        (loop (cdr l1) (cons (car l1) result))))
  (loop l1 '()))

;; Now we move to 2.27 with only the need to modify the else part of if
(define (deep-reverse l1)
  (define (loop l1 result)
    ; first level of the if statement is the same as in 2.18
    (if (null? l1)
        result
        ; the case we need to decide if the "car" we get from the operation needs deeper reverse
        ; that is the reason why we need "cons" the deep-reverse of the "car" and the result
        ; instead of just "cons" the "car" and the result
        (if (not (pair? l1))
            l1
            (loop (cdr l1) (cons (deep-reverse (car l1)) result)))))
  (loop l1 '()))

;; Test
(define y (list (list 1 2) (list 3 4)))
(deep-reverse y)
(define x (list 1 2 3 4))
(reverse x)

;; End of question 5