(use-package magit
  :defer t
  :init
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
  (setq magit-section-initial-visibility-alist (quote ((untracked . hide)))))

(use-package evil-magit
  :after magit
  :config
  (require 'evil-magit))

(use-package forge
  :after magit)

(provide 'init-magit)
