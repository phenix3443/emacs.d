;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :config
  (setq lua-indent-level 4)
  (set lua-indent-string-contents t)
  )
(provide 'lua_mode_conf)
