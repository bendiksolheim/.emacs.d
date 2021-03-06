(require 'use-package)

(cond
 ((find-font (font-spec :family "Fira Code Retina"))
  (set-frame-font "Fira Code Retina:pixelsize=18"))
 ((find-font (font-spec :family "Hasklig"))
  (set-frame-font "Hasklig:pixelsize=12"))
 ((find-font (font-spec :family "Menlo"))
  (set-frame-font "Menlo:pixelsize=12"))
 ((find-font (font-spec :family "Monaco"))
  (set-frame-font "Monaco:pixelsize=12")))

;; Make ligatures work
(let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
               (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
               (36 . ".\\(?:>\\)")
               (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
               (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
               (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
               (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
               (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
               (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
               (48 . ".\\(?:x[a-zA-Z]\\)")
               (58 . ".\\(?:::\\|[:=]\\)")
               (59 . ".\\(?:;;\\|;\\)")
               (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
               (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
               (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
               (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
               (91 . ".\\(?:]\\)")
               (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
               (94 . ".\\(?:=\\)")
               (119 . ".\\(?:ww\\)")
               (123 . ".\\(?:-\\)")
               (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
               (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
               )
             ))
  (dolist (char-regexp alist)
    (set-char-table-range composition-function-table (car char-regexp)
                          `([,(cdr char-regexp) 0 font-shape-gstring]))))

(add-hook 'helm-major-mode-hook
          (lambda ()
            (setq auto-composition-mode nil)))

(defun init/set-fonts ()
  (set-face-attribute 'default nil :height 140))

(defun init/set-gui ()
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (global-hl-line-mode 1)
  (blink-cursor-mode 0))

(defun init/load-gui ()
  "Set fonts and disable som GUI stuff"
  (interactive)
  (init/set-fonts)
  (init/set-gui)
  (setq frame-title-format nil))

(use-package all-the-icons)

(use-package doom-themes
  :config
  (load-theme 'doom-one))


(provide 'init-theme)

