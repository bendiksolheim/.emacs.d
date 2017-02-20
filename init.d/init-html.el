(require 'req-package)

(req-package web-mode
  :loader :elpa
  :mode
  (("\\.html\\'" . web-mode)
   ("\\.js\\'" . web-mode)))

(provide 'init-html)
