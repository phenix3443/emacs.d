;; -*- coding:utf-8; -*-
(require 'req-package)

(req-package auto-highlight-symbol
  :config
  ;; (require-package 'auto-highlight-symbol)
  (require 'auto-highlight-symbol)
  (global-auto-highlight-symbol-mode t)
  )
(provide 'init-auto-highlight-symbol)
