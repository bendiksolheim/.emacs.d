(use-package nxml-mode
  :mode ("\\.pom$" . nxml-mode)
  :magic ("<\\?xml" . nxml-mode)
  :init
  (setq nxml-child-indent 4
    nxml-attribute-indent 4
    nxml-slash-auto-complete-flag t))

(provide 'init-nxml)
