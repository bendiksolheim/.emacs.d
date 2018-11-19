(use-package markdown-mode
  :mode
  ("\\.md\\'" . markdown-mode)
  :init
  (setq markdown-command "multimarkdown"))

(provide 'init-markdown)
