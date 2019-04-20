;;; package --- summary  lua-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package company-lua
  :after (company)
  :ensure t
  :config
  )

(use-package lsp-lua-emmy
  :demand
  :init
  (setq lsp-lua-emmy-jar-path (expand-file-name "EmmyLua-LS-all.jar" user-emacs-directory))
  :ensure nil
  :load-path "~/github/lsp-lua-emmy"
  :hook (lua-mode . lsp)
  :config
  )

(defun set-company-backends-for-lua()
  "Set lua company backend."
  (setq-local company-backends '(
                                 (
                                  company-lsp
                                  company-lua
                                  company-keywords
                                  company-gtags
                                  company-yasnippet
                                  )
                                 company-capf
                                 company-dabbrev-code
                                 company-files
                                 )))

(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :hook (lua-mode . set-company-backends-for-lua)
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
