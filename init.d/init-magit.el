(require 'req-package)

(req-package magit)

(req-package evil-magit
  :require magit
  :config
  (require 'evil-magit))

(provide 'init-magit)
