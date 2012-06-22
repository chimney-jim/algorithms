(defpackage :lcs
  (:use :cl)
  (:export :lcs))

(defvar list1 '(A B C B D A B))
(defvar list2 '(B D C A B A))

(in-package :lcs)

(defun lcs (lst1 lst2)
  (let ((m (length lst1)) 
        (n (length lst2)))
    (setf b (make-array (list m n) :initial-element 0))
    (setf c (make-array (list m n) :initial-element 0))
    (loop for i from 0 to (- m 1)
          do (setf (aref c i 0) 0))
    (loop for j from 0 to (- n 1)
          do (setf (aref c 0 j) 0))
    (loop for i from 1 to (- m 1)
          do (loop for j from 1 to (- n 1)
                   do (if (eq (car lst1) (car lst2))
                        (lambda (c b i j) 
                          (setf (aref c i j) (+ (aref c (- i 1) (- j 1)) 1))
                          (setf (aref b i j) 1)
                          (format t "1st cond") c b i j)
                        (if (>= (aref c (- i 1) j) (aref c i (- j 1)))
                          (lambda (c b i j) 
                            (setf (aref c i j) (aref c (- i 1) j))
                            (setf (aref b i j) 2)
                            (format t "2nd cond") c b i j)
                           (lambda (c b i j) 
                             (setf (aref c i j) (aref c i (- j 1)))
                             (setf (aref b i j) 0)
                             (format t "3rd cond") c b i j)))))
    (list b c)))
