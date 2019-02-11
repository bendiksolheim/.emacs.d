(use-package js2-mode
  :mode "\\.jsx?\\'"
  :init
  (setq js2-mode-show-strict-warnings nil
        js2-mode-show-parse-errors nil
        js2-basic-offset 2
        sgml-basic-offset 2
        js-indent-level 2))

(use-package rjsx-mode
  :mode "\\.jsx?\\'"
  :commands (rjsx-mode))

(use-package json-mode
  :mode "\\.json\\'")

(use-package prettier-js
  :init
  (setq prettier-js-args '(
                           "--single-quote"
                           "--tab-width" "2"
                           ))
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'css-mode-hook 'prettier-js-mode)
  (add-hook 'typescript-mode 'prettier-js-mode))

(provide 'init-javascript)
