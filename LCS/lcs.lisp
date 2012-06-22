(defpackage :lcs
  (:use :cl)
  (:export :lcs))

(defvar list1 '(1 2 3 2 4 1 2))
(defvar list2 '(2 4 3 1 2 1))

(in-package :lcs)

(defun lcs (lst1 lst2)
  (let* ((m (length lst1)) 
         (n (length lst2))
         (b (make-array (list (+ m 1) (+ n 1)) :initial-element 0))
         (c (make-array (list (+ m 1) (+ n 1)) :initial-element 0)))
    (loop for i from 1 to m
            do (loop for j from 1 to n
                     do (if (eq (nth (- i 1) lst1) (nth (- j 1) lst2))
                          (progn
                            (setf (aref c i j) (+ (aref c (- i 1) (- j 1)) 1))
                            (setf (aref b i j) 1))
                          (if (>= (aref c (- i 1) j) (aref c i (- j 1)))
                            (progn 
                              (setf (aref c i j) (aref c (- i 1) j))
                              (setf (aref b i j) 2))
                            (progn 
                              (setf (aref c i j) (aref c i (- j 1)))
                              (setf (aref b i j) 0))))))
   (list c b)))

;;(defvar dir-list (lcs list1 list2))

;;(defvar print-lcs (dir-list lst1 lst2)
;;  (let ((m (length 
