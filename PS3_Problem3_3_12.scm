;start of 3.12

; two procedures are instructed by the book
(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

; test files

(define list1 (list 'a 'b))
(define list2 (list 'c 'd))

(define z (append list1 list2))
(display (list 'list1-after-append-is list1))
(newline)
(display (list 'z-is z))
(newline)
(define w (append! list1 list2))
(display (list 'list1-after-append!-is list1))
(newline)
(display (list 'w-is w))

; end of 3.12