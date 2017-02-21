;; https://wwwtech.de/articles//2011/jul/emacs-restore-last-frame-size-on-startup

(defun save-framegeometry ()
  "Gets the current frame's geometry and saves to ~/.emacs.d/frame"
  (let (
        (framegeometry-left (frame-parameter (selected-frame) 'left))
        (framegeometry-top (frame-parameter (selected-frame) 'top))
        (framegeometry-width (frame-parameter (selected-frame) 'width))
        (framegeometry-heigth (frame-parameter (selected-frame) 'height))
        (framegeometry-file (expand-file-name "~/.emacs.d/frame"))
        )
    (when (not (number-or-marker-p framegeometry-left))
      (setq framegeometry-left 0))
    (when (not (number-or-marker-p framegeometry-top))
      (setq framegeometry-top 0))
    (when (not (number-or-marker-p framegeometry-width))
      (setq framegeometry-width 0))
    (when (not (number-or-marker-p framegeometry-heigth))
      (setq framegeometry-heigth 0))

    (with-temp-buffer
      (insert
       ";;; This is the previous emacs frame geometry.\n"
       ";;; Last generated " (current-time-string) ".\n"
       "(setq initial-frame-alist\n"
       "      '(\n"
       (format "        (top . %d)\n" (max framegeometry-top 0))
       (format "        (left . %d)\n" (max framegeometry-left 0))
       (format "        (width . %d)\n" (max framegeometry-width 0))
       (format "        (height . %d)))\n" (max framegeometry-heigth 0)))
      (when (file-writable-p framegeometry-file)
        (write-file framegeometry-file)))))

(defun load-framegeometry ()
  "Loads ~/.emacs.d/frame, which holds the previous frame geometry"
  (let ((framegeometry-file (expand-file-name "~/.emacs.d/frame")))
    (when (file-readable-p framegeometry-file)
      (load-file framegeometry-file))))

;; Only save/load frame geometry when a window system is used
(if window-system
    (progn
      (add-hook 'after-init-hook 'load-framegeometry)
      (add-hook 'kill-emacs-hook 'save-framegeometry)))
       
(provide 'init-window-restore)
