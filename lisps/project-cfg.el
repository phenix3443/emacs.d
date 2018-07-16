;;; package --- summary  project 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package projectile
  :ensure t
  :diminish
  :config
  (projectile-mode)

  (if (equal system-type 'windows-nt)
      (progn
        (setq projectile-indexing-method 'alien)
        (setq projectile-enable-caching t)
        ))
  )

(use-package helm-projectile
  :after (helm projectile)
  :ensure t
  :config
  (helm-projectile-on)
  ;; switching projects
  (setq projectile-switch-project-action 'helm-projectile)
  ;; completion
  (setq projectile-completion-system 'helm)
  )

;; (use-package persp-mode
;;   :ensure t
;;   :config
;;   (persp-mode 1)
;;   )
(use-package sr-speedbar
  :ensure t
  :config
  )


(use-package graphviz-dot-mode
  :ensure t
  :config)

(use-package plantuml-mode
  :ensure t
  :mode "\\.plantuml$"
  :config
  (setq plantuml-jar-path (concat user-emacs-directory "plantuml.jar"))
  (add-to-list
   'org-src-lang-modes '("plantuml" . plantuml))
  )

(provide 'project-cfg)

;;; project-cfg.el ends here
