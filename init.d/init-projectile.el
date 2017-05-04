(require 'req-package)

(req-package projectile
  :init
  (progn
    (setq projectile-indexing-method 'alien)
    (setq projectile-enable-caching t))
  :config
  (progn
    (setq projectile-mode-line nil)
    (projectile-global-mode)))

(provide 'init-projectile)
