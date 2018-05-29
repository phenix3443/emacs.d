;;; package --- summary  lua-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents t)
  )

(use-package company-lua
  :requires (company lua-mode)
  :ensure t
  :config
  )

(provide 'lua-ide-cfg)
;;; lua-ide-cfg.el ends here
