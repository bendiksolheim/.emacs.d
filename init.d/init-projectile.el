(require 'req-package)

(req-package projectile
  :init
  (setq projectile-indexing-method 'alien)
  (setq projectile-enable-caching t)
  :config
  (setq projectile-mode-line nil)
  (projectile-global-mode))

(provide 'init-projectile)
