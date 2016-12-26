;; -*- coding:utf-8 -*-

(require 'use-package)

(use-package rtags
  :ensure t
  :disabled t
  :config
  (add-hook 'c-mode-common-hook 'rtags-start-process-unless-running)
  (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
  )

(provide 'rtags_conf)
