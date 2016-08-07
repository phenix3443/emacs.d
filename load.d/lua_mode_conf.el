;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package lua-mode
  :ensure t
  :config
  (autoload 'lua-mode "lua-mode" "Lua editing mode." t)
  (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
  (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
  (setq lua-indent-level 4)
  )
(provide 'init-lua-mode)
