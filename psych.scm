;; This is the code for ``Computer Psychiatrist'' (Doctor)

; for Racket users...
(#%require (only racket/base random))
; *******************

;; Start of problem 4:

;(define (visit-doctor name)
;  (write-line (list 'hello name))
;  (write-line '(what seems to be the trouble?))
;  (doctor-driver-loop name '()))

; the modified function takes no name and exists as suggested in the rubrics
(define (visit-doctor)
  (let ((name (ask-patient-name)))
    (if (equal? name 'suppertime)
        (write-line '(bye))
        (simplifier-procedure name))))

; a utility function that make things easier to read
(define (simplifier-procedure name)
  ((write-line (list 'hello name))
   (write-line '(what seems to be the trouble?))
   (doctor-driver-loop name '())
   (visit-doctor)))

;; End of problem 4

;; Start of problem 3:

;(define (doctor-driver-loop name)
;  (newline)
;  (write '**)
;  (let ((user-response (read)))
;    (cond ((equal? user-response '(goodbye))
;             (write-line (list 'goodbye name))
;             (write-line '(see you next week)))
;          (else (write-line (reply user-response))
;                (doctor-driver-loop name)))))

; add two parts, one sets up the list, one adds "earlier you said" condition
(define (doctor-driver-loop name said)
  (newline)
  (write '**)
  (let ((user-response (read)))
    (let ((said (if (null? said)
                   (list user-response)
                   (cons user-response said))))
    (cond ((equal? user-response '(goodbye))
           (write-line (list 'goodbye name))
           (write-line '(see you next week)))
          (else (if (prob 1 5)
                    (write-line (append '(earlier you said that) (change-person (pick-random said))))
                    (write-line (reply user-response)))
                (doctor-driver-loop name said))))))

;; End of problem 3

(define (reply user-response)
  (cond ((fifty-fifty)
           (append (qualifier)
                   (change-person user-response)))
        (else (hedge))))

(define (fifty-fifty)
  (= (random 2) 0))

;; Start of problem 1:

(define (qualifier)
  (pick-random '((you seem to think)
                 (you feel that)
                 (why do you believe)
                 (why do you say)
                 ; the parts I added
                 (why do you think)
                 (can you tell me more about why)
                 (you say you believe)
                 (tell me more about why))))

(define (hedge)
  (pick-random '((please go on)
                 (many people have the same sorts of feelings)
                 (many of my patients have told me the same thing)
                 (please continue)
                 ; the part I added
                 (tell me more about that)
                 (tell me why do you think this way)
                 (continue)
                 (keep going))))

;; End of problem 1

(define (replace pattern replacement lst)
  (cond ((null? lst) '())
        ((equal? (car lst) pattern)
         (cons replacement
                 (replace pattern replacement (cdr lst))))
        (else (cons (car lst) (replace pattern replacement (cdr lst))))))

;; Start of problem 2

;(define (many-replace replacement-pairs lst)
;  (cond ((null? replacement-pairs) lst)
;         (else (let ((pat-rep (car replacement-pairs)))
;            (replace (car pat-rep)
;                     (cadr pat-rep)
;                     (many-replace (cdr replacement-pairs)
;                     lst))))))

; the second part
; this singles out a word from the sentence and send it to temp-func to be further processed
(define (many-replace replacement-pairs lst)
  (define (loop replacement-pairs old-lst new-lst)
    (if (null? old-lst)
        new-lst
        (let ((word (car old-lst)))
          (loop replacement-pairs
                (cdr old-lst)
                (append new-lst (list (tmp-func word replacement-pairs)))))))
  (loop replacement-pairs lst '()))

; it replaces the word if it has appeared in the list
(define (tmp-func word replacement-pairs)
  (if (null? replacement-pairs)
      word
      (let ((pat-rep (car replacement-pairs)))
        (if (equal? word (car pat-rep))
            (cadr pat-rep)
            (tmp-func word (cdr replacement-pairs))))))

; this is the first part
(define (change-person phrase)
  (many-replace '((i you) (me you) (am are) (my your) (are am) (you i) (your my))
                phrase))

;;End of problem 2

(define (pick-random lst)
  (nth (+ 1 (random (length lst))) lst))

;;******

(define (prob n1 n2)
  (< (random n2) n1))

(define (ask-patient-name)
  (write-line '(next!))
  (write-line '(who are you?))
  (car (read)))

(define (nth n lst)
  (if (= n 1) 
      (car lst)
      (nth (- n 1) (cdr lst))))
;;******

(define (atom? a) (not (pair? a)))

(define nil '())

(define (write-line x) (begin (write x) (newline)))

;;******

