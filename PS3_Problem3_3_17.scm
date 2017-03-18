;; Start of problem 3.17

; The following code from problem 3.16
; (define (count-pairs x)
;   (if (not (pair? x))
;      0
;       (+ (count-pairs (car x))
;          (count-pairs (cdr x))
;          1)))

; As suggested by the description, we keep a auxiliary data structure to keep track
; of what pair has been counted, which is tmplist

(define (count-pairs x)
  ; let it be empty at beginning
  (let ((tmplist '()))
    ; define a iter procedure
    (define (iter x)
      (cond ((not (pair? x)) 0) ;not a pair, do nothing
            ((memq x tmplist) 0) ;the pair already counted, do nothing
            (else (begin
                    (set! tmplist
                          (cons x tmplist)) ;update the current tmplist
                    (+ (iter (car x))
                       (iter (cdr x))
                       1))))) ;check the car and cdr of the list x we want to check
    (iter x)))

;; End of problem 3.17