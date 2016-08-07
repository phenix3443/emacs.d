;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package robe
  :ensure t
  :disabled t
  :config
  (add-hook 'enh-ruby-mode-hook 'robe-mode)
  )
(provide 'robe_conf)
