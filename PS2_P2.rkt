;; begin of question 2

;; To do this question, we first need to do Exercise 2.21:
(define (square-list items)
  (if(null? items)
     '()
     (cons (* (car items) (car items)) (square-list(cdr items)))))

(define (square-list-1 item)
  (map (lambda (x)(* x x)) item))

; the algorithm given in the question:
(define (square-list-2 items)
   (define (iter things answer)
     (if (null? things)
         answer
         (iter (cdr things) 
               (cons (* (car things) (car things))
                     answer))))
   (iter items nil))

;; For 2.22:
; The methods in 2.21 apends the cdr part after the car part, or it appends the part that has not
; been squared yet to the part that has been squared.
; Since the car part is at the beginning, it gives the right order
; The iterative method apends the car part after the cdr part, which basiclly reverses the process
; in 2.21

(define (square-list-3 items)
   (define (iter things answer)
     (if (null? things)
         answer
         (iter (cdr things)
               (cons answer
                     (* (car things) (car things))))))
   (iter items nil))

; The second part has exactly the same problem as the first part

;; End of question 2