(defpackage cl-hello
  (:use :cl)
  (:export :hello))
(in-package :cl-hello)

(defun hello ()
  (princ "Hello"))
