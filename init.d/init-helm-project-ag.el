(require 'helm)
(require 'helm-grep)
(require 'cl-lib)
(require 'projectile)

(defvar helm-project-ag-base-command
  `("ag" "--nogroup" "--nocolor")
  "Base `ag` command")

(defvar helm-project-ag-input-min
  3
  "Minimum amount of characters to input before search starts")

(defvar helm-project-ag-ignore-list
  `(".git" ".svn" ".hg" "*.class")
  "List of ignored files and folders")

(defun helm-project-ag--ignore (pattern)
  "Construct ignore pattern"
  (concat "--ignore " pattern))
 
(defun helm-project-ag--process ()
  "Run ag process based on search input"
  (let* ((base-command helm-project-ag-base-command)
         (ignores (split-string (mapconcat 'helm-project-ag--ignore helm-project-ag-ignore-list " ")))
         (query `(,helm-pattern))
         (root `(,(init/project-root))) ; TODO: init/project-root exists globally, should probably make possible to import..
         (cmd (append base-command ignores query root)))
    (apply #'start-process "ag" nil cmd)))

(defun helm-project-ag--open-file (candidate)
  "Open file in search candidate and go to correct line"
  (let* ((split-candidate (helm-grep-split-line candidate))
         (filename (cl-first split-candidate))
         (line (cl-second split-candidate)))
    (find-file filename)
    (goto-char (point-min))
    (forward-line (1- (string-to-number line)))))

(defvar helm-project-ag--action
  (helm-make-actions
   "Open file" 'helm-project-ag--open-file)
  "Helm actions")

;; More or less copied from helm-ag.el
(defun helm-project-ag--display-filter (item)
  "Filter ech item"
  (helm-aif (helm-grep-split-line item)
      (format "%s:%s:%s"
              (propertize (cl-first it) 'face 'helm-moccur-buffer)
              (propertize (cl-second it) 'face 'helm-grep-lineno)
              (cl-third it))))

(defvar helm-project-ag--source
  (helm-build-async-source "Search"
    :candidates-process 'helm-project-ag--process
    :action 'helm-project-ag--action
    :candidate-number-limit 999
    :filter-one-by-one 'helm-project-ag--display-filter
    :requires-pattern helm-project-ag-input-min)
  "Helm source to search projectile folder with ag")

(defun helm-project-ag ()
  "Search project with `ag` and display results in helm"
  (interactive)
  (helm :sources '(helm-project-ag--source)
        :buffer "*helm projectile search*"))

(provide 'init-helm-project-ag)

