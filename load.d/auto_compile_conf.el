;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package auto-compile
  :ensure t
  :config
  (setq load-prefer-newer t)
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1)
  (setq auto-compile-display-buffer nil)
  (setq auto-compile-mode-line-counter t)
  )

(provide 'auto_compile_conf)
