;;; package --- summary  通用集成开发环境（IDE）配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 编辑辅助(Code generation helpers)

;; 代码模板
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1)
  )

(use-package yasnippet-snippets
  :ensure t
  :config)


;; 语义补全（code complete）
(use-package company
  :ensure t
  :diminish
  :bind (("C-c y" . company-yasnippet))
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (global-company-mode)

  (setq company-backends '((company-dabbrev-code
                            company-files
                            company-keywords
                            company-gtags
                            )))
  )

(use-package company-quickhelp
  :ensure t
  :after (company)
  :config
  (setq company-quickhelp-delay 2)
  (company-quickhelp-mode 1)
  )

(use-package lsp-mode
  :ensure t
  :hook (c-mode-common . lsp-prog-major-mode-enable)
  :config
  (lsp-define-stdio-client
   ;; This can be a symbol of your choosing. It will be used as a the
   ;; prefix for a dynamically generated function "-enable"; in this
   ;; case: lsp-prog-major-mode-enable
   lsp-prog-major-mode
   "language-id"
   ;; This will be used to report a project's root directory to the LSP
   ;; server.
   (lambda () default-directory)
   ;; This is the command to start the LSP server. It may either be a
   ;; string containing the path of the command, or a list wherein the
   ;; car is a string containing the path of the command, and the cdr
   ;; are arguments to that command.
   '("/my/lsp/server" "and" "args"))
  )

(use-package company-lsp
  :ensure t
  :disabled
  :after lsp-mode
  :config
  )

(use-package smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))

;; 语法检查（syntax checkers）
(use-package flycheck
  :ensure t
  :init
  ;; (global-flycheck-mode)
  :config
  ;; (setq flycheck-clang-include-path '("/usr/local/include/"))
  (setq flycheck-json-python-json-executable "python3")
  (setq flycheck-gcc-language-standard "c++11")
  (setq flycheck-clang-language-standard "c++11")
  (setq flycheck-emacs-lisp-load-path 'inherit)
  )

;;; 文档（document）
;;; 编译（compile）
(use-package smart-compile
  :ensure t
  :bind ([f5] . smart-compile)
  :config
  )
;;; 测试（run test）
(use-package nginx-mode
  :ensure t)

;;; 调试（debug）
;;; 静态检查
;;; 动态检查
;;; 性能分析

;;; 导航（navigation）
;; 高亮
(use-package auto-highlight-symbol
  :ensure t
  :diminish
  :config
  (global-auto-highlight-symbol-mode t)
  )
;; 代码跳转
(use-package helm-gtags
  :ensure t
  :after (helm)
  :bind-keymap("C-c g". helm-gtags-mode-map)
  :bind (:map helm-gtags-mode-map
              ("a" . helm-gtags-tags-in-this-function)
              ("b" . helm-gtags-display-browser)
              ("c" . helm-gtags-clear-cache)
              ("d" . helm-gtags-clear-all-cache)
              ("f" . helm-gtags-find-files)
              ("g" . helm-gtags-create-tags)
              ("u" . helm-gtags-update-tags)
              ("j" . helm-gtags-select)
              ("p" . helm-gtags-pop-stack)
              ("q" . helm-gtags-clear-stack)
              ("Q" . helm-gtags-clear-all-stacks)
              ("s" . helm-gtags-find-symbol)
              ("r" . helm-gtags-find-rtag)
              ("t" . helm-gtags-find-tag)
              ("," . helm-gtags-find-tag-from-here)
              ("T" . helm-gtags-find-tag-other-window)
              ("R" . helm-gtags-resume)
              ("P" . helm-gtags-parse-file)
              ("S" . helm-gtags-find-pattern)
              ("." . helm-gtags-dwim)
              ("<" . helm-gtags-previous-history)
              (">" . helm-gtags-next-history)
              )
  :config
  (custom-set-variables
   '(helm-gtags-auto-update t)
   '(helm-gtags-cache-select-result nil)
   '(helm-gtags-direct-helm-completing t)
   '(helm-gtags-display-style 'detail)
   '(helm-gtags-fuzzy-match nil)
   '(helm-gtags-highlight-candidate t)
   ;; '(helm-gtags-ignore-case t)
   '(helm-gtags-parse-file 'root)
   '(helm-gtags-path-style 'root)
   '(helm-gtags-pulse-at-cursor t)
   '(helm-gtags-read-only nil)
   '(helm-gtags-update-interval-second 30)
   '(helm-gtags-use-input-at-cursor t)
   )
  )

(provide 'common-ide-cfg)
;;; common-ide-cfg.el ends here
