;; Begin of question 6

(define (reverse l1)
  (define (loop l1 result)
    (if (null? l1)
        result
        (if (not (pair? l1))
            (list l1)
            (append (loop (car l1) result) (loop (cdr l1) result)))))
  (loop l1 '()))

; test
(define x (list (list 1 2) (list 3 4)))
(reverse x)

;; End of question 6