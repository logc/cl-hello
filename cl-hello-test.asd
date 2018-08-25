#|
  This file is a part of cl-hello project.
|#

(defsystem "cl-hello-test"
  :defsystem-depends-on ("prove-asdf")
  :author ""
  :license ""
  :depends-on ("cl-hello"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "cl-hello"))))
  :description "Test system for cl-hello"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
