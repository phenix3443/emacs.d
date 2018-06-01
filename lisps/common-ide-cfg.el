;;; package --- summary  通用集成开发环境（IDE）配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全（code complete）
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
  :after lsp-mode
  :ensure t
  :config
  )

;;; 编辑辅助(Code generation helpers)
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  )

(use-package yasnippet-snippets
  :ensure t
  :config)

(use-package smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))

;;; 代码高亮
(use-package auto-highlight-symbol
  :ensure t
  :config
  (global-auto-highlight-symbol-mode t)
  )

;;; Lint, style and syntax checkers
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

;;; code navigation
(use-package helm-gtags
  :ensure t
  :after (helm)
  :hook (prog-mode . helm-gtags-mode)
  :bind (:map helm-gtags-mode-map
              ("C-c g a" . helm-gtags-tags-in-this-function)
              ("C-c g b" . helm-gtags-display-browser)
              ("C-c g c" . helm-gtags-clear-cache)
              ("C-c g d" . helm-gtags-clear-all-cache)
              ("C-c g f" . helm-gtags-find-files)
              ("C-c g g" . helm-gtags-create-tags)
              ("C-c g u" . helm-gtags-update-tags)
              ("C-c g j" . helm-gtags-select)
              ("C-c g p" . helm-gtags-pop-stack)
              ("C-c g q" . helm-gtags-clear-stack)
              ("C-c g Q" . helm-gtags-clear-all-stacks)
              ("C-c g s" . helm-gtags-find-symbol)
              ("C-c g r" . helm-gtags-find-rtag)
              ("C-c g t" . helm-gtags-find-tag)
              ("C-c g ," . helm-gtags-find-tag-from-here)
              ("C-c g T" . helm-gtags-find-tag-other-window)
              ("C-c g R" . helm-gtags-resume)
              ("C-c g P" . helm-gtags-parse-file)
              ("C-c g S" . helm-gtags-find-pattern)
              ("C-c g ." . helm-gtags-dwim)
              ("C-c g <" . helm-gtags-previous-history)
              ("C-c g >" . helm-gtags-next-history)
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
;;; compile
(use-package smart-compile
  :ensure t
  :config
  )
;;; run test
(use-package nginx-mode
  :ensure t)
;;; Interactive environments

(provide 'common-ide-cfg)
;;; common-ide-cfg.el ends here
