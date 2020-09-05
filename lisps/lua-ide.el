;;; package --- summary  lua-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package company-lua
  :ensure t
  :after (company)
  :config
  )


(defun set-company-backends-for-lua()
  "Set lua company backend."
  (setq-local company-backends '(
                                 (
                                  company-lua
                                  company-keywords
                                  )

                                 company-gtags
                                 company-capf
                                 company-dabbrev-code
                                 company-files
                                 )))

(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :hook (
         (lua-mode . set-company-backends-for-lua)
         ;;lsp 要在set-company-backends-for-lua后面，因为lsp会添加company-lsp到company-backends最前面
         ;;这样覆盖set-company-backends-for-lua 中设置的组合backends，这里也不要使用lsp-deferred
         ;;同样的原因。这样设置lsp会在set-company-bakcends函数前面
         (lua-mode . lsp)
         )

  :config
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents t)
  (setq lua-prefix-key nil)
  )

(provide 'lua-ide)
;;; lua-ide.el ends here
