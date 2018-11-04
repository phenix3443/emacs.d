;;; package --- summary  lua-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(defun company-lua-mode-setup()
  "create lua company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-lua company-lsp) (car company-backends)))))

(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :hook (lua-mode . company-lua-mode-setup)
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

(use-package company-lua
  :after (company)
  :ensure t
  :config
  )

(provide 'lua-ide)
;;; lua-ide.el ends here
