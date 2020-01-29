(require 'use-package)


(use-package lsp-java
  :after lsp
  :config
  (add-hook 'java-mode-hook 'lsp))

(provide 'init-java)
