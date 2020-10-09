(require 'use-package)

(use-package neotree
  :init
  (setq neo-theme 'nerd
        neo-window-fixed-size nil)
  :config
  (add-hook 'neotree-mode-hook (lambda ())
    (dolist (key '(("TAB" . 'neotree-stretch-toggle)
                   ("RET" . 'neotree-enter)
                   ("l" . 'neotree-quick-look)
                   ("|" . 'neotree-enter-vertical-split)
                   ("-" . 'neotree-enter-horizontal-split)
                   ("c" . 'neotree-copy-node)
                   ("n" . 'neotree-create-node)
                   ("d" . 'neotree-delete-node)
                   ("g" . 'neotree-refresh)
                   ("j" . 'neotree-next-line)
                   ("k" . 'neotree-previous-line)
                   ("r" . 'neotree-rename-node)))
      (eval `(evil-define-key 'normal neotree-mode-map (kbd ,(car key)) ,(cdr key))))))

(provide 'init-neotree)
