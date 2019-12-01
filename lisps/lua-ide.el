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
  (print company-backends)
  (setq-local company-backends '(
                                 (
                                  company-lua
                                  company-lsp
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
         )

  :bind (:map lua-mode-map
              ("C-c l b" . lua-send-buffer)
              ("C-c l d" . lua-send-defun)
              ("C-c l f" . lua-search-documentation)
              ("C-c l h" . lua-hide-process-buffer)
              ("C-c l l" . lua-send-current-line)
              ("C-c l r" . lua-sedn-region)
              ("C-c l s" . lua-show-process-buffer)
              ("C-c l w" . lua-restart-with-whole-file))
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents t)
  (setq lua-prefix-key nil)
  )

(provide 'lua-ide)
;;; lua-ide.el ends here
