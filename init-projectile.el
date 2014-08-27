; Time-stamp: <2014-08-14 22:07:02 chengxu70>

(require 'projectile)

(add-hook 'prog-mode-hook '(lambda()
							 (projectile-mode)
							 ;(require 'perspective)
							 ;(persp-mode)
							 ;(require 'persp-projectile)
							 ))
; completion
(setq projectile-completion-system 'helm)

; caches
(setq projectile-enable-caching t )
;(setq projectile-remember-window-configs t)
(setq projectile-file-exists-remote-cache-expire (* 10 60))

;perspective
(define-key projectile-mode-map (kbd "s-s") 'projectile-persp-switch-project)

(provide 'init-projectile)
