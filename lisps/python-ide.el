;;; package --- summary python-ide 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全（code complete）
(use-package lsp-python-ms
  :ensure t
  ;;需要延迟加载，因为脚本regist client时候依赖动态改变的lsp-python-ms-extra-paths
  :defer t
  :custom
  ;; lsp-python-executable-cmd, 用来解决在 PATH 里面存在 python2 和 python3,
  ;; 并且 python 默认指向 python2(例如 macos), 而平时使用都用 python3，
  ;; 这样不能引用python3 下面的包
  (lsp-python-ms-python-executable-cmd "python3")
  (lsp-python-ms-executable "~/.emacs.d/mspyls/Microsoft.Python.LanguageServer")
  :config
  )

;;; 编辑辅助(Code generation helpers)

;;; Lint, style and syntax checkers
(defun set-company-backends-for-python()
  "Create python company backend."
  (setq-local company-backends
              '(
                company-lsp
                company-capf
                company-dabbrev-code
                company-files
                ))
  )

(use-package python-mode
  :ensure t
  :hook (
         (python-mode . set-company-backends-for-python)

         (python-mode . (lambda ()
                          (if (stringp buffer-file-name)
                              (setq lsp-python-ms-extra-paths (list (file-name-directory buffer-file-name)))
                            )
                          (require 'lsp-python-ms)
                          (lsp)
                          (setq-local eldoc-documentation-function #'ignore)
                          ))

         (python-mode . format-all-mode)
         ;; (python-mode . highlight-indent-guides-mode)
         )
  :custom
  (py-shell-name "python3")
  (py-python-command "python3")
  :config
  )

;; ;;; Lint, style and syntax checkers

;;; code navigation

;;; compile

;;; run test

;;; Interactive environments

(provide 'python-ide)
;;; python-ide.el ends here
