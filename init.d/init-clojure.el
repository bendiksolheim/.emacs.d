(require 'use-package)

(use-package clojure-mode
  :mode ( ( "\\.clj\\'" . clojure-mode )
          ( "\\.cljs\\'" . clojurescript-mode))
  )

(provide 'init-clojure)
