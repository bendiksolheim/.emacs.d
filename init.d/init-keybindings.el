(require 'use-package)

(defun init/evil-leader-group (prefix name)
  "Creates an evil leader group"
  (let ((command (intern (concat "group:" name))))
    (define-prefix-command command)
    (evil-leader/set-key prefix command)))

(defun init/global-keybindings ()
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
  (global-set-key (kbd "s-q") 'save-buffers-kill-emacs)
  (setq text-scale-mode-step 1.1)
  (global-set-key (kbd "s-+") (lambda () (interactive) (text-scale-increase 1)))
  (global-set-key (kbd "s--") (lambda () (interactive) (text-scale-decrease 1)))
  (global-set-key (kbd "s-0") (lambda () (interactive) (text-scale-set 0)))
  (global-set-key (kbd "s-j") 'next-buffer)
  (global-set-key (kbd "s-k") 'previous-buffer)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "M--") 'xref-find-definitions)
  (global-set-key (kbd "M-+") 'xref-find-references))

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

(use-package evil-leader
    :config
    (progn
      (evil-leader/set-leader "<SPC>")
      (global-evil-leader-mode)
      (dolist (group '(("a" . "apps")
                       ("b" . "buffer")
                       ("c" . "comment")
                       ("e" . "emacs")
                       ("f" . "file")
                       ("l" . "lsp")
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
        "l?" 'lsp-find-definition
        "l." 'lsp-goto-implementation
        "la" 'lsp-execute-code-action
        "lf" 'lsp-format-buffer
        "lo" 'lsp-organize-imports
        "lr" 'lsp-rename
        "pf" 'helm-projectile-find-file
        "pi" 'projectile-invalidate-cache
        "pl" 'helm-projectile-switch-project
        "pg" 'helm-projectile-find-file-dwim
        "ps" 'helm-projectile-ag
        "pv" 'projectile-vc
        "pt" 'neotree-project-dir
        "u"  'universal-argument
        "w/" 'split-window-horizontally
        "w-" 'split-window-vertically
        "w=" 'balance-windows
        "wd" 'delete-window
        "C-g" 'keyboard-quit))
    (evil-mode 1))

(provide 'init-keybindings)
