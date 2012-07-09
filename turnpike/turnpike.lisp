;;Course:       CS4413
;;Sudent Name:  Jim Fitzgerald
;;Student ID    000165563
;;Assignment #: 3
;;Due Date:     07/09/2012
;;
;;Signature:    ____________________
;;
;;Score:        _________

(defpackage :turnpike
  (:use :cl))

(in-package :turnpike)

(defvar D '(1 2 2 2 3 3 3 4 5 5 5 6 7 8 10))

(defun turnpike output-list original-list n
  (let ()
    (
     (setf output-list (append output-list 0)
           output-list (append output-list (last original-list))
           output-list (append output-list (last (butlast original-list))))
     (remove (car (last list1)) list1)
     (remove (car (last list1)) list1)
     (if (
