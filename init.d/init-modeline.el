(require 'req-package)
(require 'evil)

(defface telephone-custom-evil-insert
  '((t (:background "forest green" :inherit telephone-line-evil)))
  "Face used in evil color-coded segments when in Insert state."
  :group 'telephone-line-evil)

(defface telephone-custom-evil-normal
  '((t (:background "violet" :inherit telephone-line-evil)))
  "Face used in evil color-coded segments when in Normal state."
  :group 'telephone-line-evil)

(defface telephone-custom-evil-visual
  '((t (:background "dark orange" :inherit telephone-line-evil)))
  "Face used in evil color-coded segments when in Visual{,-Block,-Line} state."
  :group 'telephone-line-evil)

(defface telephone-custom-evil-replace
  '((t (:background "black" :inherit telephone-line-evil)))
  "Face used in evil color-coded segments when in Replace state."
  :group 'telephone-line-evil)

(defface telephone-custom-evil-motion
  '((t (:background "dark blue" :inherit telephone-line-evil)))
  "Face used in evil color-coded segments when in Motion state."
  :group 'telephone-line-evil)

(defface telephone-custom-evil-operator
  '((t (:background "violet" :inherit telephone-line-evil)))
  "Face used in evil color-coded segments when in Operator state."
  :group 'telephone-line-evil)

(defface telephone-custom-evil-emacs
  '((t (:background "dark violet" :inherit telephone-line-evil)))
  "Face used in evil color-coded segments when in Emacs state."
  :group 'telephone-line-evil)

(defun telephone-custom-evil-face (active)
  "Return an appropriate face for the current mode, given whether the frame is ACTIVE."
  (cond ((not active) 'mode-line-inactive)
        ((not (boundp 'evil-state)) 'mode-line)
        (t (intern (concat "telephone-custom-evil-" (symbol-name evil-state))))))

(defun custom-modeline-modified ()
  (let* ((config-alist
            '(("*" all-the-icons-octicon-family all-the-icons-octicon "x" :height 1.2 :v-adjust -0.0)
              ("-" all-the-icons-octicon-family all-the-icons-octicon "check" :height 1.2 :v-adjust -0.0)
              ("%" all-the-icons-octicon-family all-the-icons-octicon "lock" :height 1.2 :v-adjust 0.1)))
           (result (cdr (assoc (format-mode-line "%*") config-alist))))
      (propertize (apply (cadr result) (cddr result))
                  'face `(:family ,(funcall (car result))))))

(telephone-line-defsegment* buffer-position-segment ()
  `((-3 "%p") (" %4l:%3c")))

(req-package telephone-line
  :require evil all-the-icons
  :config
  ;;(require 'telephone-line-config)

  ; Custom segments
  (telephone-line-defsegment* major-mode-segment ()
    (format "%s"
            (propertize (all-the-icons-icon-for-buffer)
                        'help-echo (format "Major-mode: `%s`" major-mode)
                        'face `(:height 1.2 :v-adjust -0.0 :family ,(all-the-icons-icon-family-for-buffer)))))

  (telephone-line-defsegment* buffer-name-segment ()
    (format "%s %s"
            (custom-modeline-modified)
            (buffer-name)))
    ;mode-line-buffer-identification)

  (telephone-line-defsegment* buffer-status-segment ()
    `(""
      mode-line-mule-info
      mode-line-modified
      mode-line-client
      mode-line-remote
      mode-line-frame-identification))

  ; Define custom faces so we get better colors
  (setq telephone-line-faces
        '((evil . telephone-custom-evil-face)
          (accent . (telephone-line-accent-active . telephone-line-accent-inactive))
          (nil . (mode-line . mode-line-inactive))))

  ; Flat separators all over the place
  (setq telephone-line-primary-left-separator 'telephone-line-flat
        telephone-line-secondary-left-separator 'telephone-line-flat
        telephone-line-primary-right-separator 'telephone-line-flat
        telephone-line-secondary-right-separator 'telephone-line-flat)

  (setq telephone-line-height 34
        telephone-line-evil-use-short-tag t)

  (setq telephone-line-lhs
        '((evil . (buffer-position-segment))
          (accent . (major-mode-segment))
          (nil    . (buffer-name-segment))))

  (setq telephone-line-rhs
        '((nil    . (telephone-line-misc-info-segment))
          (evil . (telephone-line-vc-segment
                   telephone-line-erc-modified-channels-segment
                   telephone-line-process-segment))))

  (telephone-line-mode t))

(provide 'init-modeline)
