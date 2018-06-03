;;; package --- summary  golang ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package company-go
  :ensure t
  :after company
  :config
  )

(defun company-go-mode-setup()
  "create golang company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-go)  (car company-backends)))))

(add-hook 'go-mode-hook 'company-go-mode-setup)

(use-package go-gen-test
  :ensure t
  :config
  )

(use-package gotest
  :ensure t
  :config
  )

(use-package go-dlv
  :ensure t
  :config
  )

(use-package go-eldoc
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  )

(use-package go-guru
  :ensure t
  :config)

(use-package go-mode
  :ensure t
  :hook ((before-save . gofmt-before-save)
         (go-mode . go-guru-hl-identifier-mode))
  :config
  (setq gofmt-command "goimports")
  )

(defun my-golang-compile-hook()
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  (auto-highlight-symbol-mode) ;不知道为什么 global-auto-highlight-mode 在 go-mode 中关闭了
  )


(provide 'golang-ide-cfg)
;;; golang-ide-cfg.el ends here
