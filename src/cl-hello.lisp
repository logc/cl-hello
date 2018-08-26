(defpackage cl-hello
  (:use :cl :parser.ini)
  (:export :hello))
(in-package :cl-hello)

(defun hello (&optional config-contents)
  (defun greeted (config-contents)
    (let* ((config (parser.ini:parse config-contents 'list))
           (hello-section (get-section config "hello")))
      (get-option-value hello-section "greeted")))
  (if (not config-contents)
      (princ "Hello")
      (princ (format nil "Hello ~a" (greeted config-contents)))))

(defun get-section (config section-indicator)
  (let ((section (car config)))
    (cond
      ((not section) '())
      ((equal (getf section :name) (list section-indicator)) section)
      (T (get-section (cdr config) section-indicator)))))

(defun get-option-value (section name)
  (let ((options (car (getf (getf section :section) :section-option))))
    (defun get-option-value-recur (options name)
      (let ((option (car options)))
        (cond
          ((not option) "")
          ((equal (getf option :name) (list name)) (getf option :value))
          (T (get-option-value-recur (cdr options) name)))))
    (get-option-value-recur options name)))
