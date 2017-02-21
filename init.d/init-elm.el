(require 'req-package)

(req-package elm-mode
  :require (f s let-alist)
  :mode ("\\.elm\\'" . elm-mode)
  :config
  (setq elm-format-on-save t))

(provide 'init-elm)
