;; -*- coding:utf-8; -*-
(require 'use-package)

(use-package neotree
  :ensure t
  :config
  (setq neo-smart-open t)
  ;; (setq projectile-switch-project-action 'neotree-projectile-action)
  )

(provide 'neotree_conf)
