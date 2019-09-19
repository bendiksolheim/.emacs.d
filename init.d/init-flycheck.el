(require 'use-package)

(use-package flycheck
  :config
  (global-flycheck-mode t)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc
                                             javascript-jshint
                                             json-jsonlint)))

(use-package helm-flycheck)

(provide 'init-flycheck)
