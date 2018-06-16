(require 'req-package)

(req-package 'kotlin-mode
  :init
  (setq kotlin-tab-width 4))

(req-package 'flycheck-kotlin
  :require flycheck
  :init
  (add-to-list 'flycheck-checkers 'kotlin-klint))

(provide 'init-kotlin)
