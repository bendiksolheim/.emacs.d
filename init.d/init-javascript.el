(use-package rjsx-mode
  :mode "\\.js\\'"
  :init
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-basic-offset 2)
  (setq sgml-basic-offset 2)
  (setq js-indent-level 2)
  :config
  (evil-define-key 'insert rjsx-mode-map (kbd "C-d") 'rjsx-delete-creates-full-tag))

;; Web-mode does not trigger correct lsp mode, using rjsx-mode for now
;; (use-package web-mode
;;   :mode
;;   (("\\.js\\'" . web-mode)
;;    ("\\.html\\'" . web-mode)
;;    ("\\.mustache\\'" . web-mode))
;;   :config
;;   (setq web-mode-markup-indent-offset 2
;;         web-mode-css-indent-offset 2
;;         web-mode-enable-current-element-highlight t))

(use-package json-mode
  :mode "\\.json\\'")

(use-package prettier-js
  :init
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (setq prettier-js-args '(
                           "--single-quote"
                           "--tab-width" "2"
                           )))

(provide 'init-javascript)
