;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package iimage
  :ensure t
  :config
  (setq iimage-mode-image-search-path '(list "." "./img"))
  ;; (add-hook 'text-mode-hook 'iimage-mode)
  )
(provide 'init-iimage)
