#lang racket

(provide sum-of-squares square-of-sum difference)

(define (square number)
  (* number number))

(define (sum number)
  (/ (* number (+ number 1)) 2))

(define (sum-of-squares number)
  (/ (* number (+ number 1) (+ number number 1)) 6))

(define (square-of-sum number)
  (square (sum number)))

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number)))
