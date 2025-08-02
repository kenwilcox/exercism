#lang racket

(provide number->eggs)

(define (number->eggs n)
  (if (positive? n)
      (add1 (number->eggs (bitwise-and n (sub1 n))))
      0))
