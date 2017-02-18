(require 'req-package)

(req-package which-key
  :diminish which-key-mode
  :init
  (progn
    (setq which-key-idle-delay 0.3
          which-key-sort-order 'which-key-key-order-alpha))
  :config
  (progn
    (add-to-list 'which-key-description-replacement-alist '("init/\\(.+\\)" . "\\1"))
    (which-key-mode)))

(provide 'init-which-key)
