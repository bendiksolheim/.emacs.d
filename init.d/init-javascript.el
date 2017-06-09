(require 'req-package)

(req-package rjsx-mode
  :require prettier-js
  :defer t
  :mode
  (("\\.js\\'" . rjsx-mode))
  :init
  (setq js2-strict-missing-semi-warning t)
  (setq js2-basic-offset 4)
  (setq sgml-basic-offset 4)
  (setq js-indent-level 4))

(req-package json-mode
  :defer t)

(req-package tern
  :defer t
  :init
  (add-hook 'js2-mode-hook 'tern-mode)
 (add-hook 'web-mode-hook 'tern-mode))

(req-package company-tern
  :require company
  :defer t
  :init
  (add-to-list 'company-backends 'company-tern))

(req-package prettier-js
  :init
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (setq prettier-js-args '(
                           "--single-quote"
                           "--tab-width" "4"
                           )))

(provide 'init-javascript)
    
