(require 'req-package)

(req-package powerline)

(req-package undo-tree
  :diminish undo-tree-mode)

(req-package spacemacs-theme
  :require powerline)

(defun init/set-gui ()
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (global-hl-line-mode 1)
  (blink-cursor-mode 0))

(defun init/set-fonts ()
  (set-face-attribute 'default nil :height 140))

(defun init/load-gui ()
  "Load theme"
  (interactive)
  (init/set-fonts)
  (init/set-gui)
  (powerline-default-theme)
  (load-theme 'spacemacs-dark t))

(provide 'init-theme)
