;; -*- coding:utf-8; -*-
(require 'use-package)
(req-package ecb
  :disable t

  :config
  (setq ecb-tree-buffer-style 'ascii-guides)
  )

(provide 'init-ecb)
