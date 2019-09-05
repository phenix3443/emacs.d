;;; package --- summary  golang ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package go-mode
  :ensure t
  :hook (
         (before-save . gofmt-before-save)
         (go-mode . go-guru-hl-identifier-mode)
         (go-mode . untabify-buffer)
         )
  :config
  (setq gofmt-command "goimports")
  )

(use-package company-go
  :ensure t
  :after company
  :config
  )

(defun company-go-mode-setup()
  "Create golang company backend."
  (setq-local company-backends '(
                                 company-go
                                 company-capf
                                 company-dabbrev-code
                                 company-files)))


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


(use-package go-playground
  :ensure t
)

(provide 'golang-ide)
;;; golang-ide.el ends here
