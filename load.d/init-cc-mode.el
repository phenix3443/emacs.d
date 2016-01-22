;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package cc-mode
  :ensure t
  :config
  (setq c-default-style '((java-mode . "java")
						  (awk-mode . "awk")
						  (other . "linux")))
  )
(provide 'init-cc-mode)
