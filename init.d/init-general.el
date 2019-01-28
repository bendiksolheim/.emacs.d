(use-package s)
(use-package f)
(use-package let-alist)
;; (use-package exec-path-from-shell
;;   :config
;;   (when (memq window-system '(mac ns))
;;     (exec-path-from-shell-initialize)))

(defun custom-linum-relative-global-mode ()
  "Custom linum relative global mode which won’t load in magit"
  (add-hook 'after-change-major-mode-hook
            (lambda () (linum-relative-mode 0))
            :append :local))

(use-package linum-relative
  :ensure t
  :init
  (setq linum-relative-backend 'display-line-numbers-mode)
  :config
  (linum-relative-global-mode)
  (add-hook 'magit-mode-hook  'custom-linum-relative-global-mode))

(provide 'init-general)
