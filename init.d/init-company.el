(require 'req-package)

(req-package company
  :init
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2
	company-require-match nil
	company-dabbrev-downcase nil
	company-selection-wrap-around t
	company-tooltip-align-annotations t)
  :config
  (global-company-mode t))

(provide 'init-company)
