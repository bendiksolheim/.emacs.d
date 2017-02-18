(require 'req-package)

(req-package markdown-mode
  :init
  (setq markdown-command "multimarkdown"))

(provide 'init-markdown)
