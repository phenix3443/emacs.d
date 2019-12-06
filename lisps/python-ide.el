;;; package --- summary python-ide 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全（code complete）

(use-package company-jedi
  :ensure t
  :after (company)
  :config
  :config
  (setq jedi:complete-on-dot t)
  )

(use-package lsp-python-ms
  :ensure t
  :config
  )

;;; 编辑辅助(Code generation helpers)

;;; Lint, style and syntax checkers
(defun set-company-backends-for-python()
  "Create python company backend."
  (setq-local company-backends '(
                                 (
                                  company-lsp
                                  company-jedi
                                  )
                                 company-capf
                                 company-dabbrev-code
                                 company-files
                                 )
              ))

(use-package python-mode
  :ensure t
  :hook (
         (python-mode . set-company-backends-for-python)
         (python-mode . lsp)
         )
  :config
  (setq py-shell-name 'python3)
  )

;; ;;; Lint, style and syntax checkers

;;; code navigation

;;; compile

;;; run test

;;; Interactive environments

(provide 'python-ide)
;;; python-ide.el ends here
