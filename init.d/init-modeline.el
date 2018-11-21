;;
;; Track window state
;;

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

;;
;; Faces
;;

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

;;
;; Functions
;;

(defun mode-line-evil-face (active)
  "Return an appropriate face for the current mode, given whether the frame is ACTIVE."
  (cond ((not active) 'mode-line-inactive)
        ((not (boundp 'evil-state)) 'mode-line)
        (t (intern (concat "mode-line-evil-" (if evil-state (symbol-name evil-state) "normal"))))))

(defun custom-modeline-modified ()
  (let* ((config-alist
          '(("*" "change_history")
            ("-" "done")
            ("%" "lock")))
         (result (cadr (assoc (format-mode-line "%*") config-alist))))
    (propertize (all-the-icons-material result)
                'face `(:family ,(all-the-icons-material-family)))))

(defun custom-modeline-git-vc ()
  (let ((branch (mapconcat 'concat (cdr (split-string vc-mode "[:-]")) "-")))
    (concat
     (propertize (format "%s" (all-the-icons-octicon "git-branch"))
                 'face `(:height 1.3 :family ,(all-the-icons-octicon-family))
                 'display '(raise 0.2))
     (propertize (format " %s" branch) 'face `(:height 0.9) 'display '(raise 0.4)))))

(defun custom-modeline-svn-vc ()
  (let ((revision (cadr (split-string vc-mode "-"))))
    (concat
     (propertize (format " %s" (all-the-icons-faicon "cloud")) 'face `(:height 1.2) 'display '(raise 0.3))
     (propertize (format " . %s" revision) 'face `(:height 0.9)))))

(defun custom-modeline-icon-vc ()
  (if vc-mode
    (cond
     ((string-match "Git[:-]" vc-mode) (custom-modeline-git-vc))
     ((string-match "SVN-" vc-mode) (custom-modeline-svn-vc))
     (t (format "%s" vc-mode)))
    ""))

;;
;; Segments
;;

(defvar fake-height-segment
  (propertize " " 'display '(height 2))
  "Empty segment to force specific height")

(defvar buffer-status-segment
  '(:eval (propertize (format "  %s" (custom-modeline-modified))
                      'face (mode-line-evil-face (mode-line-selected-window-active-p))
                      'display '(raise 0.2)))
  "Buffer status")

(defvar major-mode-segment
  '(:eval (propertize (format "  %s" (propertize (all-the-icons-icon-for-buffer)
                      'help-echo (format "%s" major-mode)
                      'face `(:family ,(all-the-icons-icon-family-for-buffer) :foreground "white")
                      'display '(raise 0.3))))
          'face (mode-line-evil-face (mode-line-selected-window-active-p)))
  "Major mode")

(defvar buffer-name-segment
  '(:eval (propertize "  %b  "
                      'face (mode-line-evil-face (mode-line-selected-window-active-p))
                      'display '(raise 0.3)
                      'help-echo (buffer-file-name)))
  "Buffer name")

(defvar buffer-position-segment
  '(:eval (propertize "  %p %4l:%3c  "
                      'display '(raise 0.3)))
  "Cursor position")

(defvar vc-segment
  '(:eval (format "%s  " (custom-modeline-icon-vc))))

;;
;; Mode line
;;

(defun mode-line-fill (reserve)
  "Returns enough spaces to push mode line spaces to right"
  (propertize " "
              'display `((space :align-to (- (+ right-fringe right-margin)
                                             ,reserve)))))

(defun mode-line-segment-width (segments right-padding)
  ""
  (+ (string-width (format-mode-line segments)) right-padding))

(setq-default mode-line-format
              `(,buffer-status-segment
                ,buffer-name-segment
                ,major-mode-segment
                ,fake-height-segment
                (:eval (mode-line-fill (mode-line-segment-width (custom-modeline-icon-vc) 2)))
                ,vc-segment))

(provide 'init-modeline)
