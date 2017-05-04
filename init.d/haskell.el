(require 'req-package)

(req-package haskell-mode
  :mode
  (("\\.hs\\'" . haskell-mode)))

(req-package intero
  :require flycheck
  :init
  (defun init-intero ()
    (if (and buffer-file-name
             (string-match ".+/\\.\\(stack\\|stack-work\\)/.+" buffer-file-name))
        (progn
          (eldoc-mode -1)
          (flycheck-mode -1))
      (intero-mode)
      (setq projectile-tags-command "codex update")))
  (add-hook 'haskell-mode-hook #'init-intero)
  :config
  (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))

(provide 'init-haskell)
