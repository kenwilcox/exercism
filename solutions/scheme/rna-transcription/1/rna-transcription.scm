(import (rnrs))

(define (dna->rna dna)
  (list->string (map (lambda (n) (case n [(#\C) #\G] [(#\G) #\C] [(#\A) #\U] [(#\T) #\A]) ) (string->list dna))))

