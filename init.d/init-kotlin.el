(require 'use-package)

(use-package kotlin-mode
  :mode
  ("\\.kt\\'" . kotlin-mode)
  :init
  (setq kotlin-tab-width 4))

(use-package flycheck-kotlin
  :init
  (add-to-list 'flycheck-checkers 'kotlin-klint))

(provide 'init-kotlin)
