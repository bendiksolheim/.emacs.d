(use-package s)
(use-package f)
(use-package let-alist)
;; (use-package exec-path-from-shell
;;   :config
;;   (when (memq window-system '(mac ns))
;;     (exec-path-from-shell-initialize)))

(define-global-minor-mode custom-linum-relative-global-mode linum-mode
  (lambda ()
    (when (not (memq major-mode
                     (list 'magit-status-mode))))))

(use-package linum-relative
  :config
  (custom-linum-relative-global-mode))

(provide 'init-general)
