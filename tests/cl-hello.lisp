(defpackage cl-hello-test
  (:use :cl
        :cl-hello
        :prove))
(in-package :cl-hello-test)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-hello)' in your Lisp.

(plan nil)

(is-print (cl-hello:hello) "Hello")

(finalize)
