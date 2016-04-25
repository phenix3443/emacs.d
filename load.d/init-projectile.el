;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)

  ;; indexing and caching
  (when (equal system-type 'windows-nt)
	(setq projectile-indexing-method 'alien)
	(setq projectile-enable-caching t))

  ;; switching projects
  (setq projectile-switch-project-action 'helm-projectile)

  ;; completion
  (setq projectile-completion-system 'helm)

  )

(use-package perspective
  :ensure t)
(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on)
  )
(provide 'init-projectile)
