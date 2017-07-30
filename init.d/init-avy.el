(require 'req-package)

(req-package avy
  :config
  (setq avy-background t)
  (setq avy-timeout-seconds 0.8))

(provide 'init-avy)
