(require 'use-package)

;; (use-package web-mode
;;   :mode "\\.jsx?$"
;;   :init
;;   (setq web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'"))
;;         web-mode-markup-indent-offset 2))

(use-package js2-mode
  :mode "\\.jsx?\\'"
  :init
  (setq js2-mode-show-strict-warnings nil
        js2-mode-show-parse-errors nil
        js2-basic-offset 2
        sgml-basic-offset 2
        js-indent-level 2))

(use-package rjsx-mode
  :after js2-mode
  :hook (js2-mode . rjsx-minor-mode))

;; (use-package json-mode
;;   :mode "\\.json\\'")

(use-package prettier-js
  :init
  (setq prettier-js-args '(
                           "--single-quote"
                           "--tab-width" "2"
                           ))
  :hook ((js2-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)
         (css-mode . prettier-js-mode)))

(provide 'init-javascript)
