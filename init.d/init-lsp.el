(use-package lsp-mode
  :commands lsp
  :init
  (setq lsp-print-io t)
  :config
  (add-hook 'rjsx-mode-hook 'lsp)
  (add-hook 'css-mode 'lsp))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package company-lsp
  :after company
  :commands company-lsp
  :config
  (setq company-lsp-cache-candidates 'auto)
  (push 'company-lsp company-backends))

(provide 'init-lsp)
