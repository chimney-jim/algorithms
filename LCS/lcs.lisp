(defpackage :lcs
  (:use :cl)
  (:export :lcs))

(defvar list1 '(1 3 5 4 2 6 7))
(defvar list2 '(8 3 4 9 2 1))

(in-package :lcs)

(defun lcs (lst1 lst2)
  (let ((m (length lst1)) 
        (n (length lst2)))
    (let ((b (make-array (list m n) :initial-element 0))
          (c (make-array (list m n) :initial-element 0)))
      (loop for i from 1 to (- m 1)
            do (loop for j from 1 to (- n 1)
                     do (if (eq (nth i lst1) (nth j lst2))
                          (progn
                            (setf (aref c i j) (+ (aref c (- i 1) (- j 1)) 1))
                            (setf (aref b i j) 1))
                          (if (>= (aref c (- i 1) j) (aref c i (- j 1)))
                            (progn 
                              (setf (aref c i j) (aref c (- i 1) j))
                              (setf (aref b i j) 2))
                            (progn 
                              (setf (aref c i j) (aref c i (- j 1)))
                              (setf (aref b i j) 0)))))))
    (list b c)))
