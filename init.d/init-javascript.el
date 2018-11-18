(use-package rjsx-mode
  :mode
  (("\\.js\\'" . rjsx-mode))
  :init
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-basic-offset 2)
  (setq sgml-basic-offset 2)
  (setq js-indent-level 2)
  :config
  (evil-define-key 'insert rjsx-mode-map (kbd "C-d") 'rjsx-delete-creates-full-tag))

(use-package json-mode
  :defer t)

(use-package tern
  :defer t
  :init
  (add-hook 'js2-mode-hook 'tern-mode)
 (add-hook 'web-mode-hook 'tern-mode))

;;(use-package company-tern
  ;;:defer t
  ;;:init
  ;;(add-to-list 'company-backends 'company-tern))

(use-package prettier-js
  :init
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (setq prettier-js-args '(
                           "--single-quote"
                           "--tab-width" "2"
                           )))

(provide 'init-javascript)
    
