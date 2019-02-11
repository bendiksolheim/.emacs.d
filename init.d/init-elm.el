(use-package elm-mode
  :mode ("\\.elm\\'" . elm-mode)
  :config
  (setq elm-format-on-save t)
  (add-to-list 'company-backend 'company-elm)
  (add-hook 'elm-mode-hook 'elm-oracle-setup-completion))

(use-package flycheck-elm
  :init
  (add-hook 'flycheck-mode-hook 'flycheck-elm-setup t))

(provide 'init-elm)
