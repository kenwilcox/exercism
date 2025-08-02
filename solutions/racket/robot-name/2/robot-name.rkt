#lang racket

(provide make-robot
         name
         reset!
         reset-name-cache!)

(struct robot (name) #:mutable)

(define name robot-name)

(define name-cache (mutable-set))

(define (reset-name-cache!)
  (set-clear! name-cache))

(define (make-robot)
  (robot (make-name)))

(define (reset! rbt)
  (set-robot-name! rbt (make-name)))

(define (random-letter)
  (integer->char (+ (char->integer #\A)
                    (random 26))))

(define (make-name)
  (let ([new-name (string-append (string (random-letter) (random-letter))
                                 (number->string (random 100 1000)))])
    (if (set-member? name-cache new-name)
        (make-name)
        (begin (set-add! name-cache new-name) new-name))))