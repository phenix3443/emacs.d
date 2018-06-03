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
  :after (company)
  :ensure t
  :config
  )

(defun company-lua-mode-setup()
  "create lua company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-lua company-lsp) (car company-backends)))))

(add-hook 'lua-mode-hook 'company-lua-mode-setup)

(provide 'lua-ide-cfg)
;;; lua-ide-cfg.el ends here
