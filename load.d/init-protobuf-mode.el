;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package protobuf-mode
  :ensure t
  :config
  (setq auto-mode-alist  (cons '(".proto$" . protobuf-mode) auto-mode-alist))
  )

(provide 'init-protobuf-mode)
