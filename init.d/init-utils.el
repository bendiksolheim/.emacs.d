(defun init/edit-emacs-config ()
  "Edit ~/.emacs.d/init.el"
  (interactive)
  (find-file "~/.emacs.d/config.el"))

(defun init/kill-other-buffers ()
  "Kills all buffers except the current"
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(provide 'init-utils)
