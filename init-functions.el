;; (require 'projectile)

(defun init/osascript-activate (app)
  "Run applescript to activate application"
  (shell-command (format "osascript -e 'tell application \"%s\" to activate'" app)))

;; (defun init/project-root ()
;;   "Get project root without throwing"
;;   (let (projectile-require-project-root strict-p)
;;     (projectile-project-root)))

(defun init/open-in-intellij ()
  "Opens current file in IntelliJ IDEA"
  (interactive)
  (shell-command
   (let* ((cmd "/Applications/IntelliJ\\ IDEA.app/Contents/MacOS/idea %s")
          (args " --line %d %s")
          (root (init/project-root))
          (file-name (buffer-file-name)))
     (if file-name
         (format (concat cmd args)
                 root
                 (line-number-at-pos)
                 (shell-quote-argument file-name))
       (format cmd root))))
  (init/osascript-activate "IntelliJ IDEA"))

(defun init/open-in-android-studio ()
  "Opens current file in Android Studio"
  (interactive)
  (shell-command
   (let* ((cmd "/Applications/Android\\ Studio.app/Contents/MacOS/studio %s")
          (args " --line %d %s")
          (root (init/project-root))
          (file-name (buffer-file-name)))
     (if file-name
         (format (concat cmd args)
                 root
                 (line-number-at-pos)
                 (shell-quote-argument file-name))
       (format cmd root))))
  (init/osascript-activate "Android Studio"))

(provide 'init-functions)

