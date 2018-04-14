(defun init/evil-leader-group (prefix name)
  "Creates an evil leader group"
  (let ((command (intern (concat "group:" name))))
    (define-prefix-command command)
    (evil-leader/set-key prefix command)))

(defun init/global-keybindings ()
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)
  (global-set-key (kbd "s-q") 'save-buffers-kill-emacs)
  (setq text-scale-mode-step 1.1)
  (global-set-key (kbd "s-+") (lambda () (interactive) (text-scale-increase 1)))
  (global-set-key (kbd "s--") (lambda () (interactive) (text-scale-decrease 1)))
  (global-set-key (kbd "s-0") (lambda () (interactive) (text-scale-set 0)))
  (global-set-key (kbd "s-j") 'next-buffer)
  (global-set-key (kbd "s-k") 'previous-buffer))

(provide 'init-keybindings)
