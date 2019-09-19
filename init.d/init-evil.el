(require 'use-package)

(setq evil-want-C-u-scroll t)

(use-package evil)

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
