;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package yasnippet
  :ensure t
  :bind (
  		 :map yas-minor-mode-map
  			  ;; Remove Yasnippet's default tab key binding
  			  ("TAB" . nil)
  			  ("<tab>" . nil)
  			  ;; Set Yasnippet's key binding to shift+tab
  			  ("<backtab>" . yas-expand))
  :config
  (yas-global-mode 1)

  )

(provide 'yasnippet_conf)
