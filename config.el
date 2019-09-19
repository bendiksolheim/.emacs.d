(setq inhibit-splash-screen t
      initial-scratch-message nil
      initial-major-mode 'org-mode
      debug-on-error t)

;; Expand load-dir to include custom packages
(add-to-list 'load-path (expand-file-name "init.d" (file-name-directory load-file-name)))

;; Package Management
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package)
  (setq use-package-compute-statistics t)
  (setq use-package-always-ensure t))

(load "~/.emacs.d/init-functions.el")

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Custom functions
(require 'init-utils)
(add-hook 'before-save-hook 'init/force-backup-of-buffer)
(init/setup-backups)

;; GUI stuff
(require 'init-theme)
(init/load-gui)

;; Global packages
(require 'init-window-restore)
(require 'init-settings)
(require 'init-general)
(require 'init-evil)
(require 'init-modeline)
(require 'init-which-key)
(require 'init-window)
(require 'init-company)
(require 'init-projectile)
(require 'init-helm)
(require 'init-magit)
(require 'init-shackle)
(require 'init-anzu)
(require 'init-avy)
;;(require 'init-dumb-jump)
(require 'init-flycheck)
(require 'init-neotree)
(require 'init-restclient)
(require 'init-lsp)

;; Languages
(require 'init-elm)
(require 'init-haskell)
(require 'init-html)
(require 'init-javascript) ;; Must be after html for rjsx-mode to autoload for js files
(require 'init-kotlin)
(require 'init-markdown)
;;(require 'init-nxml)
(require 'init-remark)
(require 'init-typescript)
;(require 'init-vue)

;; Finally, activate sane key bindings
(require 'init-keybindings)
(init/global-keybindings)
