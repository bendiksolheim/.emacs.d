(require 'use-package)

(use-package magit
  :defer t
  :config
  (setq magit-display-buffer-function 'magit-display-buffer-fullframe-status-v1
        magit-section-initial-visibility-alist '((stashes . hide)
                                                 (untracked . show)
                                                 (unstaged . show)
                                                 (unpushed . hide))))

(use-package evil-magit
 :after magit
 :config
 (require 'evil-magit))

(provide 'init-magit)
