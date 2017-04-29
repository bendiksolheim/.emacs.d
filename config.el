(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode)

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
    kept-new-versions 10  ;; Number of newest versions to keep
    kept-old-versions 0   ;; Number of oldest versions to keep
    delete-old-versions t ;; Don’t ask to delete excess backup versions
    backup-by-copying t   ;; Copy all files, don’t rename them
    backup-directory-alist '(("" . "~/.emacs.d/backups/per-save"))
    vc-make-backup-files t))

(add-hook 'before-save-hook 'force-backup-of-buffer)
(init/setup-backups)

;; Package Management
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("org" . "http://orgmode.org/elpa/")
        ("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
	     (require package))))

(require-package 'req-package)
(require-package 'load-dir)
(require 'req-package)
(require 'load-dir)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(req-package--log-set-level 'debug)


(req-package load-dir
  :force t
  :init
  (setq force-load-messages nil
	load-dir-debug t
	load-dir-recursive t)
  :config
  (load-dir-one "~/.emacs.d/init.d")
  (req-package-finish)
  (init/global-keybindings)
  (init/load-gui))
  ;(req-package--log-open-log))
