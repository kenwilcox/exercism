#lang racket

(provide two-fer)

(define (two-fer [str ""])
  (if(non-empty-string? str) 
    (string-append "One for " str ", one for me.") 
    "One for you, one for me."))
