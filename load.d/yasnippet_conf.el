;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package yasnippet
  :ensure t
  :config
  ;; Remove Yasnippet's default tab key binding
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  ;; Set Yasnippet's key binding to shift+tab
  (define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

  (yas-global-mode 1)
  )
(provide 'init-yasnippet)
