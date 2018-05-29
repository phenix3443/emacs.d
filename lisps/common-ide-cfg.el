;;; package --- summary  通用集成开发环境（IDE）配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
;;; code complete



(use-package smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))


(use-package smart-compile
  :ensure t
  :config
  )

(use-package yasnippet-snippets
  :ensure t
  :config)


(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  )

(use-package company
  :ensure t
  :bind (("C-c y" . company-yasnippet))
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (global-company-mode)

  (setq company-common-backends '(company-capf
                                  company-dabbrev-code
                                  company-files
                                  company-gtags
                                  ))

  (defun company-c/c++-mode-setup ()
    (set (make-local-variable 'company-backends)
         ;; irony should be install
         ;; (list (append '(
         ;;                 company-clang
         ;;                 company-c-headers
         ;;                 )
         ;;               company-common-backends
         ;;               ))
         (list '(company-irony company-irony-c-headers) company-common-backends)

         ))

  (add-hook 'c-mode-hook 'company-c/c++-mode-setup)
  (add-hook 'c++-mode-hook 'company-c/c++-mode-setup)

  (defun company-cmake-mode-setup()
    (set (make-local-variable 'company-backends)
         (list (append '(company-cmake)  company-common-backends))))

  (add-hook 'cmake-mode 'company-cmake-mode-setup)

  (defun company-elisp-mode-setup ()
    (set (make-local-variable 'company-backends)
         (list (append '(company-elisp)  company-common-backends))))

  (add-hook 'emacs-lisp-mode-hook 'company-elisp-mode-setup)

  (defun company-lua-mode-setup ()
    (set (make-local-variable 'company-backends)
         (list (append '(company-lua company-lsp)  company-common-backends))))

  (add-hook 'lua-mode-hook 'company-lua-mode-setup)

  (defun company-python-mode-hook ()
    (set (make-local-variable 'company-backends)
         (list (append '(company-jedi)  company-common-backends))))

  (add-hook 'python-mode-hook 'company-python-mode-hook)

  (defun company-restclient-mode-setup()
    (set (make-local-variable 'company-backends)
         (list (append '(company-restclient)  company-common-backends))))

  (add-hook 'restclient-mode-hook 'company-restclient-mode-setup)

  (defun company-go-mode-setup ()
    (set (make-local-variable 'company-backends)
         (list (append '(company-go)  company-common-backends))))

  (add-hook 'go-mode-hook 'company-go-mode-setup)
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
  :config)

;;; hilight
(use-package auto-highlight-symbol
  :ensure t
  :config
  (global-auto-highlight-symbol-mode t)
  )

;;; checker
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  ;; (setq flycheck-clang-include-path '("/usr/local/include/"))
  (setq flycheck-json-python-json-executable "python3")
  ;; (setq flycheck-gcc-language-standard "c++11")
  (setq flycheck-emacs-lisp-load-path 'inherit)
  )


(use-package flycheck-irony
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))


(use-package header2
  :ensure t
  )

(provide 'common-ide-cfg)
;;; common-ide-cfg.el ends here
