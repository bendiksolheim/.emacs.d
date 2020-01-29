(require 'use-package)

(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)
         ("\\.tsx\\'" . typescript-mode))
  :init
  (setq typescript-indent-level 2))

(provide 'init-typescript)
