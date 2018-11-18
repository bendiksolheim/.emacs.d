(use-package helm
  :config
  (require 'helm-config)
  (bind-key "C-j" 'helm-next-line helm-map)
  (bind-key "C-k" 'helm-previous-line helm-map)
  (setq helm-display-function 'pop-to-buffer)
  (helm-mode 1))

(use-package helm-projectile
  :config
  (setq projectile-completion-system 'helm)
  (helm-projectile-on))

(use-package helm-swoop)

(provide 'init-helm)
