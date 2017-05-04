(require 'req-package)

(req-package s)
(req-package f)
(req-package let-alist)
(req-package exec-path-from-shell
  :force
  :config
  (when (memq window-system '(mac ns))
    (exec-path-from-shell-initialize)))

(provide 'init-general)
