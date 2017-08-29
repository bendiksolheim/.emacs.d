(require 'req-package)

(req-package dumb-jump
  :require (helm evil-leader)
  :config
  (init/evil-leader-group "g" "goto")
  (evil-leader/set-key
    "gg" 'dumb-jump-go
    "go" 'dumb-jump-go-other-window)
  (setq dumb-jump-selector 'helm
        dumb-jump-force-searcher 'ag
        dumb-jump-aggressive nil))

(provide 'init-dumb-jump)
