; Time-stamp: <2014-08-11 14:49:46 chengxu70>

(require 'projectile)

(add-hook 'c-mode-hook 'projectile-on)
(setq projectile-enable-caching t)
(provide 'init-projectile)
