(defparameter things '(4 -3 5 -2 -1 2 6 -2))
(defparameter subthings1 (list))
(defparameter subthings2 (list))
(defparameter master-list (list))

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
