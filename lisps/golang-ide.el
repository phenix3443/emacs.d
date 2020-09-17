;;; package --- summary  golang ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(defun company-go-mode-setup()
  "Create golang company backend."
  (setq-local company-backends '(
                                 company-capf
                                 company-dabbrev-code
                                 company-files)))


(use-package go-mode
  :ensure t
  :hook (
         (before-save . gofmt-before-save)
         (go-mode . company-go-mode-setup)
         )

  :config
  (setq gofmt-command "goimports")
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

(provide 'golang-ide)
;;; golang-ide.el ends here
