(defun init/force-backup-of-buffer ()
  ;; Make a special "per session" backup at the first save of each
  ;; emacs session.
  (when (not buffer-backed-up)
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backups/per-session")))
        (kept-new-versions 3))
      (backup-buffer)))
  
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(defun init/setup-backups ()
  (setq version-control t     ;; Use version numbers for backups
    kept-new-versions 10  ;; Number of newest versions to keep
    kept-old-versions 0   ;; Number of oldest versions to keep
    delete-old-versions t ;; Don’t ask to delete excess backup versions
    backup-by-copying t   ;; Copy all files, don’t rename them
    backup-directory-alist '(("" . "~/.emacs.d/backups/per-save"))
    vc-make-backup-files t))

(add-hook 'before-save-hook 'force-backup-of-buffer)

;; Yes or no prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; nxml-mode
(setq nxml-child-indent 4
      nxml-attribute-indent 4
      nxml-slash-auto-complete-flag t)
(setq evil-want-C-u-scroll t)

;; General settings
(setq tab-width 4
      indent-tabs-mode nil)
(setq echo-keystrokes 0.1
      use-dialog-box nil
      visible-bell t)
(show-paren-mode t)
(setq mac-option-key-is-meta t
      mac-option-modifier 'meta
      mac-command-key-is-meta nil
      mac-right-option-modifier nil
      mac-command-modifier 'super
      x-select-enable-clipboard t)

(provide 'init-settings)
