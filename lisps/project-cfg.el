;;; package --- summary  project 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package projectile
  :ensure t
  :diminish
  :bind-keymap("C-c p" . projectile-command-map)
  :config
  (projectile-mode +1)
  (setq projectile-completion-system 'helm)
  )

(use-package helm-projectile
  :after (helm projectile)
  :ensure t
  :config
  (helm-projectile-on)
  )

(use-package perspective
  :ensure t
  :disabled
  :config
  (persp-mode)
  )

(use-package persp-projectile
  :after (projectile perspective)
  :disabled
  :ensure t
  :config
  ;; (define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)
  )

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
  (setq plantuml-output-type "png")
  (add-to-list
   'org-src-lang-modes '("plantuml" . plantuml))
  )

(provide 'project-cfg)

;;; project-cfg.el ends here
