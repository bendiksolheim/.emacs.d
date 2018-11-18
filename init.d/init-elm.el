(use-package elm-mode
  :mode ("\\.elm\\'" . elm-mode)
  :config
  (setq elm-format-on-save t)
  (add-hook 'elm-mode-hook
            (lambda ()
              (setq-local company-backends
                          (append
                            '(company-elm)
                            company-backends))))
  (add-hook 'elm-mode-hook 'elm-oracle-setup-completion))

(use-package flycheck-elm
  :init
  (add-hook 'flycheck-mode-hook 'flycheck-elm-setup t))

(provide 'init-elm)
