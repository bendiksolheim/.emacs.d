(use-package magit
  :init
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1)
  (setq magit-section-initial-visibility-alist (quote ((untracked . hide)))))

(use-package evil-magit
  :config
  (require 'evil-magit))

(provide 'init-magit)
