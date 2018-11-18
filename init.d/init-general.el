(use-package s)
(use-package f)
(use-package let-alist)
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(use-package linum-relative
  :config
  (linum-mode)
  (linum-relative-global-mode))

(provide 'init-general)
