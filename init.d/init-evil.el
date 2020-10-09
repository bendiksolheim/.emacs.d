(require 'use-package)

(setq evil-want-C-u-scroll t)

(use-package evil)

(use-package evil-surround
  :config
  (global-evil-surround-mode 1)
  (defmacro define-and-bind-quoted-text-object (name key start-regex end-regex)
  (let ((inner-name (make-symbol (concat "evil-inner-" name)))
        (outer-name (make-symbol (concat "evil-a-" name))))
    `(progn
       (evil-define-text-object ,inner-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count nil))
       (evil-define-text-object ,outer-name (count &optional beg end type)
         (evil-select-paren ,start-regex ,end-regex beg end type count t))
       (define-key evil-inner-text-objects-map ,key #',inner-name)
       (define-key evil-outer-text-objects-map ,key #',outer-name))))
  (define-and-bind-quoted-text-object "slash" "/" "/" "/")
  (define-and-bind-quoted-text-object "pipe" "|" "|" "|")
  (define-and-bind-quoted-text-object "dollar" "*" "*" "*")
  (define-and-bind-quoted-text-object "dollar" "$" "\\$" "\\$"))

(provide 'init-evil)
