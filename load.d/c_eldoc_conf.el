;; -*- coding:utf-8; -*-
(require 'use-package)

(use-package c-eldoc
  :ensure t
  :config
  (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
  (add-hook 'c++-mode-hook 'c-turn-on-eldoc-mode)
  )

(provide 'c_eldoc_conf)
