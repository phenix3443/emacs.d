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


;; 代码补全（code complete）
(use-package company
  :ensure t
  ;; :diminish
  :bind (("C-c y" . company-yasnippet))
  :init
  (setq company-backends '((company-dabbrev-code
                            company-files
                            company-keywords
                            company-gtags
                            )))
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (global-company-mode)
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
  :commands lsp
  :hook ((lua-mode) . lsp)
  :config
  ;; 注册lua-lsp
  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-stdio-connection "lua-lsp")
  ;;                   :major-modes '(lua-mode)
  ;;                   :server-id 'lua-lsp))

  ;; 注册emmy-lua-lsp
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection (list
                                                           "/usr/bin/java"
                                                           "-cp"
                                                           (expand-file-name "EmmyLua-LS-all.jar" user-emacs-directory)
                                                           "com.tang.vscode.MainKt"))
                    :major-modes '(lua-mode)
                    :server-id 'emmy-lua))
  )

(use-package lsp-ui
  :ensure t
  :after lsp-mode
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  )

(use-package company-lsp
  :ensure t
  :after lsp-mode
  :config
  (setq company-lsp-enable-recompletion t)
  )

(use-package smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))

;; 语法检查（syntax checkers）
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  ;; c/c++
  ;; (setq flycheck-clang-include-path '("/usr/local/include/"))
  (setq flycheck-gcc-language-standard "c++11")
  (setq flycheck-clang-language-standard "c++11")
  ;; elisp
  (setq flycheck-emacs-lisp-load-path 'inherit)
  ;; json

  ;; python
  (setq flycheck-json-python-json-executable "python3")
  (setq flycheck-python-pylint-executable "/usr/local/bin/pylint")
  )

;;; 文档（document）
(use-package helm-dash
  :ensure t
  :config
  (setq helm-dash-docsets-path "~/docsets")
  (setq helm-dash-common-docsets '(
                                   "C"
                                   "C++"
                                   "Django"
                                   "Go"
                                   "Lua"
                                   "Nginx"
                                   "Python 3"
                                   ))
  )

(use-package zeal-at-point
  :ensure t
  :config
  (add-to-list 'zeal-at-point-mode-alist
               '(perl-mode . "perl")
               )
  )

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

(use-package helm-xref
  :ensure t
  :config
  (setq xref-show-xrefs-function 'helm-xref-show-xrefs)
  )

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

(use-package gist
  :ensure t
  :config
  )

(provide 'common-ide)
;;; common-ide.el ends here
