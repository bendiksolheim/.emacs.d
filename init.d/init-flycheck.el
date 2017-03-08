(require 'req-package)

(req-package flycheck
  :diminish flycheck-mode
  :config
  (global-flycheck-mode t)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc
                                             javascript-jshint
                                             json-jsonlint)))

(req-package helm-flycheck
 :require flycheck)

(provide 'init-flycheck)
