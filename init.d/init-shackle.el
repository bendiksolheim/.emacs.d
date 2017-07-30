(require 'req-package)

(req-package shackle
  :config
  (shackle-mode 1)
  (setq shackle-rules
        '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :ratio 0.4))))

(provide  'init-shackle)
