(require 'use-package)

(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'js2-mode-hook 'lsp)
  :config
  (require 'lsp-clients)
  (add-to-list 'lsp-language-id-configuration '(rjsx-mode . "javascript"))
  (setq lsp-enable-snippet nil))

(use-package lsp-ui
  :init
  (setq lsp-ui-sideline-show-code-actions nil
        lsp-ui-peek-fontify t)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

(provide 'init-lsp)
