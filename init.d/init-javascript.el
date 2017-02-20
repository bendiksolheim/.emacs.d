(require 'req-package)

(req-package js2-mode
  :defer t
  :mode
  (("\\.js\\'" . js2-mode))
  :init
  (setq js2-strict-missing-semi-warning t))

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

(provide 'init-javascript)
    
