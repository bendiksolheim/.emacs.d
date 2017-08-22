(require 'req-package)

;; Somehow does not work setting this in :init
(setq evil-want-C-u-scroll t)
(req-package evil
    :require (evil-leader linum-relative)
    :config
    (progn
      (evil-mode 1)))

(req-package linum-relative
  :config
  (linum-mode)
  (linum-relative-global-mode))

(defun neotree-project-dir ()
  "Open Neotree  using the git root"
  (interactive)
  (let ((project-dir (projectile-project-root))
        (file-name (buffer-file-name)))
    (neotree-toggle)
    (if project-dir
        (if (neo-global--window-exists-p)
            (progn
              (neotree-dir project-dir)
              (neotree-find file-name)))
      (message "Could not find project root."))))

(req-package evil-leader
    :require (helm helm-ag init-keybindings init-utils avy)
    :config
    (progn
      (evil-leader/set-leader "<SPC>")
      (global-evil-leader-mode)
      (dolist (group '(("b" . "buffer")
                       ("c" . "comment")
                       ("e" . "emacs")
                       ("f" . "file")
                       ("g" . "magit")
                       ("m" . "major")
                       ("p" . "project")
                       ("w" . "window")))
        (init/evil-leader-group (car group) (cdr group)))
      (evil-leader/set-key
        "<SPC>" 'avy-goto-char
        "1" 'select-window-1
        "2" 'select-window-2
        "3" 'select-window-3
        "4" 'select-window-4
        "5" 'select-window-5
        "6" 'select-window-6
        "be" 'eval-buffer
        "bk" 'kill-buffer
        "bK" 'init/kill-other-buffers
        "bl" 'helm-buffers-list
        "br" 'revert-buffer
        "cl" 'comment-line
        "ec" 'init/edit-emacs-config
        "fr" 'revert-buffer
        "gs" 'magit-status
        "pf" 'helm-projectile-find-file
        "pi" 'projectile-invalidate-cache
        "pl" 'helm-projectile-switch-project
        "pg" 'projectile-vc
        "ps" 'helm-projectile-ag
        "pt" 'neotree-project-dir
        "w/" 'split-window-horizontally
        "w-" 'split-window-vertically
        "w=" 'balance-windows
        "wd" 'delete-window
        "C-g" 'keyboard-quit)))

(req-package evil-surround
  :require evil
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
