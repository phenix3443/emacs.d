;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package cc-mode
  :ensure t
  :init
  ;; (setq c-basic-offset 8)
  (setq c-default-style '((java-mode . "java")
						  (awk-mode . "awk")
						  (other . "linux")))
  )
  :config
  ;; (c-set-offset 'substatement-open 0)

(provide 'init-cc-mode)
