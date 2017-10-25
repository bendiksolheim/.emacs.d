(require 'req-package)

(req-package helm
  :diminish helm-mode
  :config
  (progn
    (require 'helm-config)
    (bind-key "C-j" 'helm-next-line helm-map)
    (bind-key "C-k" 'helm-previous-line helm-map)
    (helm-mode 1)))

(req-package helm-ag
  :require (helm ag))

(req-package helm-projectile
  :require (helm projectile)
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(req-package helm-swoop
  :require helm)

(provide 'init-helm)
