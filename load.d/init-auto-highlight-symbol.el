;; -*- coding:utf-8; -*-

(require 'use-package)
(req-package auto-highlight-symbol

  :config
  (require 'linkd)
  (global-auto-highlight-symbol-mode t)
  )


(provide 'init-auto-highlight-symbol)
