(require 'req-package)
(req-package projectile
  :require perspective helm-projectile helm-ag
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

(provide 'init-projectile)
