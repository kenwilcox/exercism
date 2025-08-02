#lang racket
(provide make-robot
         name
         reset!
         reset-name-cache!)

(define (random-char from to)
  (integer->char
   (+ (char->integer from)
      (random
       (add1 (- (char->integer to)
                (char->integer from)))))))

(define cache (make-hash))

(define (make-robot)
  (let ([robot (string (random-char #\A #\Z)
                       (random-char #\A #\Z)
                       (random-char #\0 #\9)
                       (random-char #\0 #\9)
                       (random-char #\0 #\9))])
    (if (hash-ref cache robot #f)
        (make-robot)
        (begin0 robot
          (hash-set! cache robot #t)))))

(define (name robot) robot)
(define (reset! robot) (make-robot))
(define (reset-name-cache!) (hash-clear! cache))

