;;; package --- summary  通用集成开发环境（IDE）配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 编辑辅助(Code generation helpers)
(use-package flycheck
  :ensure t
  :diminish
  :init
  (global-flycheck-mode)
  :config
  ;; c/c++

  (setq flycheck-gcc-language-standard "c++11")
  (setq flycheck-clang-language-standard "c++11")

  ;; elisp
  (setq flycheck-emacs-lisp-load-path 'inherit)

  ;; json

  ;; python

  )

(use-package smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))

(use-package auto-highlight-symbol
  :ensure t
  :diminish
  :config
  (global-auto-highlight-symbol-mode t)
  )

(use-package helm-dash
  :ensure t
  :bind ("C-c d d" . helm-dash-at-point)
  :config
  (setq helm-dash-docsets-path "~/docsets")
  )

(use-package zeal-at-point
  :ensure t
  :bind ("C-c d z" . zeal-at-point)
  :config
  (add-to-list 'zeal-at-point-mode-alist '(perl-mode . "perl"))
  (add-to-list 'zeal-at-point-mode-alist '(python-mode . ("python" "django")))
  )

;; 代码补全（code complete）
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :config
  (yas-global-mode 1)
  )

(use-package yasnippet-snippets
  :ensure t
  :config)

(use-package company
  :ensure t
  ;; :diminish
  :bind (("C-c y" . company-yasnippet))
  :init
  :config
  (setq company-minimum-prefix-length 4)
  (setq company-show-numbers t)
  (global-company-mode)
  )

(use-package company-box
  :ensure t
  :diminish
  :disabled t
  :hook (company-mode . company-box-mode)
  :config
  )

(use-package company-quickhelp
  :ensure t
  :after (company)
  :config
  (setq company-quickhelp-delay 1)
  (company-quickhelp-mode 1)
  )

(use-package company-statistics
  :ensure t
  :after (company)
  :config
  (company-statistics-mode)
  )

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (
         (cmake-mode . lsp-deferred)
         (dockerfile-mode. lsp-deferred)
         (go-mode . lsp-deferred)
         (java-mode . lsp-deferred)
         (js-mode . lsp-deferred)
         (json-mode . lsp-deferred)
         (sh-mode . lsp-deferred)
         (yaml-mode . lsp-deferred)
         )

  :config
  (setq lsp-prefer-flymake nil)
  (setq lsp-keep-workspace-alive nil)
  (setq lsp-signature-auto-activate t)
  (setq lsp-eldoc-enable-hover nil)
  )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :bind (:map lsp-ui-mode-map
              ("C-c r d" . lsp-ui-peek-find-definitions)
              ("C-c r r" . lsp-ui-peek-find-references)
              ("C-c r i" . lsp-ui-imenu)
              ("C-c r F" . lsp-ui-sideline-apply-code-actions)
              ("C-c r R" . lsp-rename)
              )
  :config
  (setq lsp-ui-doc-header t
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-enable t
        lsp-ui-flycheck-enable t
        lsp-ui-doc-position 'top
        )
  )


(use-package dap-mode
  :ensure t
  :config
  (dap-mode t)
  (dap-ui-mode t)
  )

(use-package format-all
  :ensure t
  :config
  :hook (
         (cmake-mode . format-all-mode)
         (dockerfile-mode . format-all-mode)
         (emacs-lisp-mode . format-all-mode)
         (js-mode . format-all-mode)
         (json-mode . format-all-mode)
         (lua-mode . format-all-mode)
         (markdown-mode . format-all-mode)
         (python-mode . format-all-mode)
         (yaml-mode . format-all-mode)
         )
  )


;;; 文档（document）

;;; 编译（compile）
(use-package smart-compile
  :ensure t
  :bind ([f5] . smart-compile)
  :config
  (add-to-list 'smart-compile-alist
               '(python-mode . "python3 %f"))

  (add-to-list 'smart-compile-alist
               '(lua-mode . "lua %f"))

  (add-to-list 'smart-compile-alist
               '(go-mode . "go run %f"))

  (add-to-list 'smart-compile-alist
               '(js-mode . "node %f"))
  )


;;; 测试（run test）

;;; 调试（debug）

;;; 性能分析

;;; 导航（navigation）
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

(use-package vlf
  :ensure t
  :bind-keymap ("C-c v". vlf-mode-map)
  :config
  (require 'vlf-setup)
  )

(provide 'common-ide)
;;; common-ide.el ends here
