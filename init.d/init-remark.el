(require 'req-package)

(req-package remark-mode
  :defer t
  :mode
  (("\\.remark\\'" . remark-mode)))

(provide 'init-remark)
