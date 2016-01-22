;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (color-theme-sanityinc-tomorrow--define-theme eighties)
  )
(provide 'init-themes)
