(require 'use-package)

(use-package which-key
  :init
  (setq which-key-idle-delay 0.3
        which-key-sort-order 'which-key-key-order-alpha)
  :config
  (add-to-list 'which-key-description-replacement-alist '("init/\\(.+\\)" . "\\1"))
  (which-key-mode))

(provide 'init-which-key)
