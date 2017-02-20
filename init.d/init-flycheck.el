(require 'req-package)

(req-package flycheck
  :diminish flycheck-mode
  :init
  (global-flycheck-mode t)
  :config
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc
                                             javascript-jshint
                                             json-jsonlint)
		flycheck-c/c++-gcc-executable "gcc"))

(req-package helm-flycheck
 :require flycheck)

(provide 'init-flycheck)
