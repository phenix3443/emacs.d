;;; package --- summary  通用集成开发环境（IDE）配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全（code complete）
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  )

(use-package yasnippet-snippets
  :ensure t
  :config)

(use-package company
  :ensure t
  :bind (("C-c y" . company-yasnippet))
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (global-company-mode)

  (setq company-backends '((company-capf
                              company-dabbrev-code
                              company-files
                              company-gtags
                              )))
  )

(use-package company-quickhelp
  :requires (company)
  :ensure t
  :config
  (setq company-quickhelp-delay 2)
  (company-quickhelp-mode 1)
  )

(use-package lsp-mode
  :ensure t
  :config
  ;; (lsp-define-stdio-client
  ;;  ;; This can be a symbol of your choosing. It will be used as a the
  ;;  ;; prefix for a dynamically generated function "-enable"; in this
  ;;  ;; case: lsp-prog-major-mode-enable
  ;;  lsp-prog-major-mode
  ;;  "language-id"
  ;;  ;; This will be used to report a project's root directory to the LSP
  ;;  ;; server.
  ;;  (lambda () default-directory)
  ;;  ;; This is the command to start the LSP server. It may either be a
  ;;  ;; string containing the path of the command, or a list wherein the
  ;;  ;; car is a string containing the path of the command, and the cdr
  ;;  ;; are arguments to that command.
  ;;  '("/my/lsp/server" "and" "args"))

  ;; (add-hook 'c-mode-common-hook #'lsp-prog-major-mode-enable)
  )

(use-package company-lsp
  :requires lsp-mode
  :ensure t
  :config
  )

;;; 代码编辑
(use-package smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))

;;; 编译
(use-package smart-compile
  :ensure t
  :config
  )

;;; 代码高亮
(use-package auto-highlight-symbol
  :ensure t
  :config
  (global-auto-highlight-symbol-mode t)
  )

;;; 语法检查（syntax check）
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  ;; (setq flycheck-clang-include-path '("/usr/local/include/"))
  (setq flycheck-json-python-json-executable "python3")
  (setq flycheck-gcc-language-standard "c++11")
  (setq flycheck-clang-language-standard "c++11")
  (setq flycheck-emacs-lisp-load-path 'inherit)
  )

;;; other ide
(use-package nginx-mode
  :ensure t)

(provide 'common-ide-cfg)
;;; common-ide-cfg.el ends here
