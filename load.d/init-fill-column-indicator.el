;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package fill-column-indicator
  :ensure t
  :config
  (require 'fill-column-indicator)
  (add-hook 'prog-mode-hook (lambda () (fci-mode 1)))
  )
