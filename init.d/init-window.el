(require 'use-package)

(use-package ace-window
  :config
  (setq aw-dispatch-always t)
  (defvar aw-dispatch-alist
    '((?x aw-delete-window "Ace - Delete Window")
      (?m aw-swap-window "Ace - Swap Window")
      (?n aw-flip-window "Ace - Previous Window")
      (?c aw-split-window-fair "Ace - Split Fair Window")
      (?- aw-split-window-horz "Ace - Split Horizontal Window")
      (?k aw-split-window-vert "Ace - Split Vertical Window")
      (?o delete-other-windows "Ace - Delete Other Windows")))
  (evil-global-set-key 'normal "'" 'ace-window))

(provide 'init-window)
