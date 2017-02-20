(require 'req-package)

;; Somehow does not work setting this in :init
(setq evil-want-C-u-scroll t)
(req-package evil
    :require (evil-leader relative-line-numbers)
    :config
    (progn
      (evil-mode 1)))

(req-package evil-leader
    :require (helm helm-ag init-keybindings init-utils)
    :config
    (progn
      (evil-leader/set-leader "<SPC>")
      (global-evil-leader-mode)
      (dolist (group '(("b" . "buffer")
                       ("c" . "compile")
                       ("e" . "emacs")
                       ("f" . "file")
                       ("p" . "project")
                       ("w" . "window")))
        (init/evil-leader-group (car group) (cdr group)))
      (evil-leader/set-key
        "1" 'select-window-1
        "2" 'select-window-2
        "3" 'select-window-3
        "4" 'select-window-4
        "5" 'select-window-5
        "6" 'select-window-6
        "be" 'eval-buffer
        "bK" 'kill-buffer
        "bl" 'helm-buffers-list
        "ec" 'init/edit-emacs-config
        "fr" 'revert-buffer
        "pf" 'helm-projectile-find-file
        "pi" 'projectile-invalidate-cache
        "pl" 'helm-projectile-switch-project
        "ps" 'helm-projectile-ag
        "w/" 'split-window-horizontally
        "w-" 'split-window-vertically
        "wd" 'delete-window
        "C-g" 'keyboard-quit)))

(req-package relative-line-numbers
  :config
  (progn
    (global-relative-line-numbers-mode)))

(provide 'init-evil)
