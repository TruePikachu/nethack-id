(defsystem :nethack-id
  :description "Nethack object identification system"
  :version "1.0"
  :author "Chris Dusto <cricket_lover@live.com>"
  :bug-tracker "https://github.com/TruePikachu/nethack-id/issues"
  :license "MIT License"
  :components
  ((:file "item"
          :depends-on ("package"))
   (:file "package")))
