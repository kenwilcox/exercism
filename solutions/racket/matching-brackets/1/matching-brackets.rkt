#lang racket

(provide balanced?)

(define (balanced? str)
  (letrec ([recur (lambda (s lst)
                    (cond
                      [(cons? s)
                       (case (car s)
                         [(#\() (recur (cdr s) (cons #\) lst))]
                         [(#\[) (recur (cdr s) (cons #\] lst))]
                         [(#\{) (recur (cdr s) (cons #\} lst))]
                         [(#\) #\] #\})
                          (if
                           (and (cons? lst) (eq? (car s) (car lst))) (recur (cdr s) (cdr lst))
                           #f)]
                         [else (recur (cdr s) lst)])]
                      [(empty? s) (empty? lst)]
                      ))])
    (recur (string->list str) '())))
