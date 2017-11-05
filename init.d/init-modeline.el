(require 'all-the-icons)
(require 'evil)

;; Track window state
(defvar mode-line-selected-window nil)

(defun mode-line--set-selected-window ()
  "Update current active window"
  (when (not (minibuffer-window-active-p (frame-selected-window)))
    (setq mode-line-selected-window (frame-selected-window))))

(add-hook 'window-configuration-change-hook #'mode-line--set-selected-window)
(add-hook 'focus-in-hook #'mode-line--set-selected-window)

(defadvice select-window (after mode-line-select-window activate)
  "Set telephone-line's selected window value for use in determining the active mode-line."
  (mode-line--set-selected-window))
(defadvice select-frame (after mode-line-select-frame activate)
  "Set telephone-line's selected window value for use in determining the active mode-line."
  (mode-line--set-selected-window))

(defun mode-line-selected-window-active-p ()
  "Return whether the current window is active."
  (eq mode-line-selected-window (selected-window)))

;; Faces
(defface mode-line-base
  '((t (:foreground "white" :weight bold)))
  "Base mode line face"
  :group 'mode-line-face)

(defface mode-line-evil-insert
  '((t (:background "forest green" :inherit mode-line-base)))
  "Face used in evil color-coded segments when in Insert state."
  :group 'mode-line-face)

(defface mode-line-evil-normal
  '((t (:background "violet" :inherit mode-line-base)))
  "Face used in evil color-coded segments when in Normal state."
  :group 'mode-line-face)

(defface mode-line-evil-visual
  '((t (:background "dark orange" :inherit mode-line-base)))
  "Face used in evil color-coded segments when in Visual{,-Block,-Line} state."
  :group 'mode-line-face)

(defface mode-line-evil-replace
  '((t (:background "black" :inherit mode-line-base)))
  "Face used in evil color-coded segments when in Replace state."
  :group 'mode-line-face)

(defface mode-line-evil-motion
  '((t (:background "dark blue" :inherit mode-line-base)))
  "Face used in evil color-coded segments when in Motion state."
  :group 'mode-line-face)

(defface mode-line-evil-operator
  '((t (:background "violet" :inherit mode-line-base)))
  "Face used in evil color-coded segments when in Operator state."
  :group 'mode-line-face)

(defface mode-line-evil-emacs
  '((t (:background "dark violet" :inherit mode-line-base)))
  "Face used in evil color-coded segments when in Emacs state."
  :group 'mode-line-face)

;; Functions
(defun mode-line-evil-face (active)
  "Return an appropriate face for the current mode, given whether the frame is ACTIVE."
  (cond ((not active) 'mode-line-inactive)
        ((not (boundp 'evil-state)) 'mode-line)
        (t (intern (concat "mode-line-evil-" (symbol-name evil-state))))))

(defun custom-modeline-modified ()
  (let* ((config-alist
          '(("*" . "change_history")
            ("-" . "done")
            ("%" . "lock")))
         (result (cdr (assoc (format-mode-line "%*") config-alist))))
    (propertize (all-the-icons-material (cdr result))
                'face `(:family ,(all-the-icons-material-family)))))

;; Segments
(defvar fake-height-segment
  (propertize " " 'display '(height 2))
  "Empty segment to force specific height")

(defvar buffer-status-segment
  '(:eval (propertize (format "  %s" (custom-modeline-modified))
                      'face (mode-line-evil-face (mode-line-selected-window-active-p))
                      'display '(raise 0.2)))
                      ;; 'display '(height 1.2 raise 0.5)))
  "Buffer status")

(defvar major-mode-segment
  '(:eval (propertize (format "  %s" (all-the-icons-icon-for-buffer))
                      'help-echo (format "%s" major-mode)
                      'face `(:family (,(all-the-icons-icon-family-for-buffer)) :foreground "white")
                      'display '(raise 0.3)))
  "Major mode")

(defvar buffer-name-segment
  '(:eval (propertize "  %b  "
                      'face (mode-line-evil-face (mode-line-selected-window-active-p))
                      'display '(raise 0.3)
                      'help-echo (buffer-file-name)))
  "Buffer name")

(defvar buffer-position-segment
  '(:eval (propertize "  %p %4l:%3c"
                      'face 'mode-line-base
                      'display '(raise 0.3)))
  "Cursor position")

;; Set mode line format
(setq-default mode-line-format
              (list buffer-status-segment
                    buffer-name-segment
                    major-mode-segment
                    buffer-position-segment
                    fake-height-segment))
