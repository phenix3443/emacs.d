;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package moe-theme
  :ensure t
  :init
  ;; (use-package powerline
  ;; 	:ensure t)

  ;; (require 'powerline)
  :config
  ;; Show highlighted buffer-id as decoration. (Default: nil)
  (setq moe-theme-highlight-buffer-id t)
  ;; Resize titles (optional).
  (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0))
  (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0))
  (setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))

  (moe-dark)
  ;; (require 'moe-theme-switcher)

  ;; Choose a color for mode-line.(Default: blue)
  ;; (moe-theme-set-color 'orange)
  ;; (moe-theme-random-color)
  ;; (powerline-moe-theme)
  )
(provide 'moe_theme_conf)
