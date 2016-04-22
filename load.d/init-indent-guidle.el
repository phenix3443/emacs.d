;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package indent-guide
  :ensure t
  :disabled t
  :config
  (setq indent-guide-delay 0.1)
  (indent-guide-global-mode)

  ;; (setq indent-guide-recursive t)
  )
(provide 'init-indent-guidle)
