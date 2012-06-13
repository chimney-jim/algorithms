(defpackage :max-subseq
  (:nicknames :max-subseq)
  (:use :cl))

(in-package :max-subseq)

(defparameter things '(4 -3 5 -2 -1 2 6 -2))
(defparameter subthings1 (list))
(defparameter subthings2 (list))
(defparameter master-list (list))
(defparameter x 1)
(defvar left-max-sum)
(defvar right-max-sum)

(defun list-split (to-split)
  (setf subthings1
        (subseq to-split 0 (/ (length things) 2)))
  (setf subthings2
        (subseq to-split (/ (length things) 2) (length things))))

(list-split things)

(defun set-master-list (to-sum)
  (let ((master-list) (shorter-list (remove (first to-sum) to-sum)))
    (setf master-list (append master-list (loop for x on to-sum collect x)))
    (setf master-list (append master-list (loop for x on (reverse to-sum) collect x)))
    (unless (eq shorter-list NIL) (set-master-list shorter-list))))

(defun comb (m list fn)
  (labels ((comb1 (l c m)
                  (when (>= (length l) m)
                    (if (zerop m) (return-from comb1 (funcall fn c)))
                    (comb1 (cdr l) c m)
                    (comb1 (cdr l) (cons (first l) c) (1- m)))
                  (print l)
                  (print c)
                  (print m)
                  (format t "~%end pass ~a" x)
                  (setf x (+ 1 x))))
    (comb1 list nil m)))

(defun max-sum (list left right)
  (let (max-left 0) (max-right 0) (left-sum 0) (right-sum 0) (center (/ (+ left right) 2))
    (if (= left right)
      (first list)
      (nil))
    (loop for i to left
