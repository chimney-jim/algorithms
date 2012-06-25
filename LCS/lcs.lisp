;;Course:       CS4413
;;Student Name: Jim Fitzgerald
;;Student ID:   000165563
;;Assignment #: 2
;;Due Date:     06/25/2012
;;
;;Signature:    ______________________
;;
;;Score:        __________

(defpackage :lcs
  (:use :cl)
  (:export :lcs))

;;Both lists predefined, but can handle any
(defvar list1 '(A B C B D A B))
(defvar list2 '(B D C A B A))

(in-package :lcs)

;;Define the function and take in 2 lists
(defun lcs (lst1 lst2)
  (let* (;;let m and n be the length of each list
         (m (length lst1)) 
         (n (length lst2))
         ;;let b be the "arrows" array and c be the length of lcs array
         (b (make-array (list (+ m 1) (+ n 1)) :initial-element 3))
         (c (make-array (list (+ m 1) (+ n 1)) :initial-element 0))
         (return-list '()))
    ;;loops to set up the arrows and length of lcs arrays
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
    ;;(print b c)
    ;;loop to print out lcs in form of a list
    (loop while (/= (aref b m n) 3) do
                         (cond ((eq (aref b m n) 1)
                             (progn
                               (decf m)
                               (decf n)
                               (setf return-list (append (list (nth m lst1)) return-list))))
                            ((eq (aref b m n) 2)
                             (progn
                               (decf m)))
                            ((eq (aref b m n) 0)
                             (progn
                               (decf n)))))
    return-list))
