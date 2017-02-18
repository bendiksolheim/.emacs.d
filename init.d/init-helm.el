(require 'req-package)

(req-package helm
  :diminish helm-mode
  :config
  (progn
    (require 'helm-config)
    (bind-key "C-j" 'helm-next-line helm-map)
    (bind-key "C-k" 'helm-previous-line helm-map)
    (helm-mode 1)))

(req-package helm-ag)

(req-package helm-projectile
  :require (projectile helm)
  :config
  (progn
    (helm-projectile-on)))

(provide 'init-helm)
