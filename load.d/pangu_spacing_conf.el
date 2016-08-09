;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package pangu-spacing
  :ensure t
  :config
  (setq pangu-spacing-real-insert-separtor t)
  (global-pangu-spacing-mode 1)
  )
(provide 'pangu_spacing_conf)
