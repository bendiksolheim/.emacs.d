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
