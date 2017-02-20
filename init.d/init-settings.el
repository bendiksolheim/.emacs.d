;; Yes or no prompts
(fset 'yes-or-no-p 'y-or-n-p)

;; General settings
(setq-default tab-width 4
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
