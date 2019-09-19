(require 'use-package)

(use-package company
  :init
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2
        company-require-match nil
        company-selection-wrap-around t
        company-tooltip-limit 10
        company-tooltip-align-annotations t)
  :config
  (global-company-mode t)
  (define-key company-active-map (kbd "C-j") 'company-select-next-or-abort)
  (define-key company-active-map (kbd "C-k") 'company-select-previous-or-abort)
  (define-key company-active-map (kbd "<tab>") 'company-complete-selection))

(use-package company-box
  :hook (company-mode . company-box-mode))

(provide 'init-company)
