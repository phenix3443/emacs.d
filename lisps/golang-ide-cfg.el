;;; package --- summary  golang ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package company-go
  :requires company
  :ensure t
  :config
  )

(defun my-golang-compile-hook()
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  (auto-highlight-symbol-mode) ;不知道为什么 global-auto-highlight-mode 在 go-mode 中关闭了
  )

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
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'my-golang-compile-hook)
  ;; (add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
  )

(defun company-go-mode-setup()
  "create golang company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-go)  (car company-backends)))))

(add-hook 'go-mode-hook 'company-go-mode-setup)

(provide 'golang-ide-cfg)
;;; golang-ide-cfg.el ends here
