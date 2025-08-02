#lang racket

(require racket/date)

(provide add-gigasecond)

(define (add-gigasecond date)
  (seconds->date (+ (date->seconds date) 1e9)))