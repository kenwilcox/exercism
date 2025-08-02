(defpackage :yacht
  (:use :cl)
  (:export :score))
(in-package :yacht)

(defun score (scores category)
  "Returns the score of the dice for the given category."
  (case category
    (:ones (* (count 1 scores) 1))
    (:twos (* (count 2 scores) 2))
    (:threes (* (count 3 scores) 3))
    (:fours (* (count 4 scores) 4))
    (:fives (* (count 5 scores) 5))
    (:sixes (* (count 6 scores) 6))
    (:full-house (if (and (< 1 (count (nth 0 scores) scores) 4)
                          (eql 2(length (remove-duplicates scores))))
                     (apply #'+ scores) 0))
    (:four-of-a-kind (if (> (count (nth 1 scores) scores) 3) (* 4 (nth 1 scores)) 0))
    (:little-straight (if (equal (sort scores #'<) '(1 2 3 4 5)) 30 0))
    (:big-straight (if (equal (sort scores #'<) '(2 3 4 5 6)) 30 0))
    (:choice (apply #'+ scores))
    (:yacht (if (eql 1 (length (remove-duplicates scores))) 50 0))
    ))
