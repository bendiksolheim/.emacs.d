;(package-initialize)

(setq-default gc-cons-threshold 100000000)
(let ((file-name-handler-alist nil))
  (load-file "~/.emacs.d/config.el"))
