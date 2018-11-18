;; Backup files
;; Make a special "per session" backup at the first save of each
;; emacs session.
(defun init/force-backup-of-buffer ()
  (when (not buffer-backed-up)
    (let ((backup-directory-alist '(("" . "~/.emacs.d/backups/per-session")))
        (kept-new-versions 3))
      (backup-buffer)))
  
  (let ((buffer-backed-up nil))
    (backup-buffer)))

(defun init/setup-backups ()
  (setq version-control t     ;; Use version numbers for backups
    kept-new-versions 10      ;; Number of newest versions to keep
    kept-old-versions 0       ;; Number of oldest versions to keep
    delete-old-versions t     ;; Don’t ask to delete excess backup versions
    backup-by-copying t       ;; Copy all files, don’t rename them
    backup-directory-alist '(("" . "~/.emacs.d/backups/per-save"))
    vc-make-backup-files t))

(defun init/edit-emacs-config ()
  "Edit ~/.emacs.d/init.el"
  (interactive)
  (find-file "~/.emacs.d/config.el"))

(defun init/kill-other-buffers ()
  "Kills all buffers except the current"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(provide 'init-utils)
