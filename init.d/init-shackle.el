(require 'req-package)

(req-package shackle
  :require helm
  :config
  (shackle-mode 1)
  (setq helm-display-function 'pop-to-buffer)
  (setq shackle-rules
        '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :ratio 0.4))))

(provide  'init-shackle)
