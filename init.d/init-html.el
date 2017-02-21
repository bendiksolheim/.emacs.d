(require 'req-package)

(req-package web-mode
  :loader :elpa
  :mode
  (("\\.html\\'" . web-mode)
   ("\\.js\\'" . web-mode)))

(req-package less-css-mode
  :mode ("\\.less\\'" . less-css-mode))

(provide 'init-html)
