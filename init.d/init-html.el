(require 'use-package)

(use-package web-mode
  :mode
  (("\\.html\\'" . web-mode)))

(use-package less-css-mode
  :mode ("\\.less\\'" . less-css-mode))

(provide 'init-html)
