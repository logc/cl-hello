#|
  This file is a part of cl-hello project.
|#

(defsystem "cl-hello"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("parser.ini")
  :components ((:module "src"
                :components
                ((:file "cl-hello"))))
  :description ""
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.org"))
  :in-order-to ((test-op (test-op "cl-hello-test"))))
