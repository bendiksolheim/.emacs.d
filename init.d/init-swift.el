(require 'use-package)

(use-package swift-mode)

(use-package lsp-sourcekit
  :after lsp-mode
  :config
  (setq lsp-sourcekit-executable
        (expand-file-name (concat
                           (getenv "SOURCEKIT_TOOLCHAIN_PATH")
                           "/usr/bin/sourcekit-lsp"))))

(provide 'init-swift)
