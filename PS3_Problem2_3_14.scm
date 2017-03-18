;; Start of problem 2

(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

; test

(define v (list 'a 'b 'c 'd))
(display v)
(define w (mystery v))
(display v)
(display w)

;; End of problem 2
