;;; Time-stamp: <2014-08-14 22:07:02 chengxu70>
(require-package 'projectile)

(require 'projectile)
(projectile-global-mode)

(require-package 'helm-projectile)
(require 'helm-projectile)
(helm-projectile-on)

;; indexing
;;(setq projectile-indexing-method 'alien)
;; caching
(when (equal system-type 'windows-nt)
  (setq projectile-enable-caching t))
;; switching projects
(setq projectile-remember-window-configs t)
(setq projectile-switch-project-action 'helm-projectile-find-file)
;; completion
(setq projectile-completion-system 'helm)

;;perspective
;;(require-package 'perspective)
;;(require 'persp-projectile)

(global-set-key (kbd "<f8>") 'helm-semantic-or-imenu)
	 

(provide 'init-projectile)
