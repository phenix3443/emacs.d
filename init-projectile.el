; Time-stamp: <2014-08-11 21:16:39 chengxu70>

(require 'projectile)

(add-hook 'prog-mode-hook '(lambda()
							 (projectile-mode t)))

(provide 'init-projectile)
