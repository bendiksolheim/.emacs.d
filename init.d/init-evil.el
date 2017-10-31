(require 'req-package)

(setq evil-want-C-u-scroll t)

;; Somehow does not work setting this in :init
(req-package evil
  :require linum-relative)

(req-package linum-relative
  :diminish linum-relative-mode
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
    :require (evil helm helm-swoop init-keybindings init-utils avy)
    :config
    (progn
      (evil-leader/set-leader "<SPC>")
      (global-evil-leader-mode)
      (dolist (group '(("a" . "apps")
                       ("b" . "buffer")
                       ("c" . "comment")
                       ("e" . "emacs")
                       ("f" . "file")
                       ("m" . "major")
                       ("p" . "project")
                       ("w" . "window")))
        (init/evil-leader-group (car group) (cdr group)))
      (evil-leader/set-key
        "<SPC>" 'avy-goto-char
        "am" 'magit-status
        "ba" 'init/open-in-android-studio
        "be" 'eval-buffer
        "bi" 'init/open-in-intellij
        "bk" 'kill-buffer
        "bK" 'init/kill-other-buffers
        "bl" 'helm-buffers-list
        "br" 'revert-buffer
        "bs" 'helm-swoop
        "cl" 'comment-line
        "ec" 'init/edit-emacs-config
        "fr" 'revert-buffer
        "pf" 'helm-projectile-find-file
        "pi" 'projectile-invalidate-cache
        "pl" 'helm-projectile-switch-project
        "pg" 'projectile-vc
        "ps" 'helm-project-ag
        "pt" 'neotree-project-dir
        "w/" 'split-window-horizontally
        "w-" 'split-window-vertically
        "w=" 'balance-windows
        "wd" 'delete-window
        "C-g" 'keyboard-quit))
    (evil-mode 1))

(req-package evil-surround
  :require evil
  :config
  (global-evil-surround-mode 1))

(provide 'init-evil)
