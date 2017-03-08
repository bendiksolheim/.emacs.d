(require 'req-package)

(req-package elm-mode
  :require (f s let-alist company)
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

(req-package flycheck-elm
  :require (flycheck elm-mode)
  :init
  (add-hook 'flycheck-mode-hook 'flycheck-elm-setup t))

(provide 'init-elm)
