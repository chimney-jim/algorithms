(defpackage :lcs
  (:use :cl))

(in-package :lcs)

(defun show-board (board)
  (loop for i below (car (array-dimensions board)) do
        (loop for j below (cadr (array-dimensions board)) do
              (let ((cell (aref board i j)))
                (format t "~a" cell)))
        (format t "~%")))

(defun lcs (lst1 lst2)
  (let ((m (- (length lst1) 1)) 
        (n (- (length lst2) 1))
        (b (make-array '(m n)))
        (c (make-array '(m n))))
    (loop for i from 0 to m
          do (setf (aref c i 0) 0))
    (loop for j from 0 to n
          do (setf (aref c 0 j) 0))
    (loop for i from 0 to m
          do (loop for j from 0 to n
                   do (if (eq (car lst1) (car lst2))
                        (lambda (c b i j) 
                          (setf (aref c i j) (+ (aref c (- i 1) (- j 1)) 1))
                           (setf (aref b i j) 1) c b i j)
                        (if (>= (aref c (- i 1) j) (aref c i (- j 1)))
                          (lambda (c b i j) 
                            (setf (aref c i j) (aref c (- i 1) j))
                             (setf (aref b i j) 2) c b i j)
                           (lambda (c b i j) 
                             (setf (aref c i j) (aref c i (- j 1)))
                              (setf (aref b i j) 0) c b i j)))))
    (show-board c)
    (show-board b)))
