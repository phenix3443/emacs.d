;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package flycheck
  :ensure t
  :disabled t
  :config
  (add-hook 'prog-mode-hook #'flycheck-mode)
  (setq flycheck-check-syntax-automatically '(mode-enabled save))

  )

(provide 'flycheck_conf)
