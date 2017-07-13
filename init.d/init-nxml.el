(require 'req-package)

(req-package nxml-mode
  :mode (("\\.pom$" . nxml-mode))
  :init
    (setq nxml-child-indent 4
	nxml-attribute-indent 4
	nxml-slash-auto-complete-flag t)
    :config
    (add-to-list 'magic-mode-list '("<\\?xml" . nxml-mode)))

(provide 'init-nxml)
