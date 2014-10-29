; Time-stamp: <2014-08-14 22:07:02 chengxu70>
(require-package 'projectile)
(require-package 'helm-projectile)

(require 'projectile)
(projectile-global-mode)
(require 'helm-projectile)
(helm-projectile-on)


;indexing
(setq projectile-indexing-method 'alien)
;caching
(setq projectile-enable-caching t)
;switching projects
(setq projectile-switch-project-action 'helm-projectile)
;completion
(setq projectile-completion-system 'helm)
;key binding
(setq projectile-keymap-prefix (kbd "C-c p"))

;perspective
(require-package 'perspective)
(require 'persp-projectile)

(define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)

(provide 'init-projectile)
