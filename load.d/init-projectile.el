;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  ;; Helm Integration

  (helm-projectile-on)

  ;; indexing and caching
  (when (equal system-type 'windows-nt)
	(setq projectile-enable-caching t))
  ;; switching projects
  (setq projectile-switch-project-action 'helm-projectile-find-file)
  ;; completion
  (setq projectile-completion-system 'helm)

  )
  
(use-package perspective
  :ensure t)
(use-package helm-projectile
  :ensure t
  )
(provide 'init-projectile)
