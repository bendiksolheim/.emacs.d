(require 'use-package)

(use-package projectile
  :init
  (setq projectile-indexing-method 'hybrid
        projectile-enable-caching t
        projectile--mode-line nil
        projectile-project-root-files
        '(".projectile"
          "package.json"
          "pom.xml"
          "build.gradle")
        projectile-project-root-files-functions
        '(projectile-root-local
          projectile-root-top-down
          projectile-root-top-down-recurring
          projectile-root-bottom-up))
  :config
  (add-to-list 'projectile-globally-ignored-directories "*docs")
  (projectile-mode 1)
  (projectile-register-project-type 'npm '("package.json")
                                    :compile "npm install"
                                    :test "npm test"
                                    :run "npm start"))

(provide 'init-projectile)
