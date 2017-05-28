;; -*- coding:utf-8; -*-

(require 'use-package)


(use-package company-lua
  :ensure t
  :config
  (defun company-lua-mode-setup ()
	(set (make-local-variable 'company-backends)
		 (list (append common-backends '(
										 company-lua
										 )))))

  (add-hook 'lua-mode-hook 'company-lua-mode-setup)
  )

(use-package company-jedi
  :ensure t
  :config
  (defun company-python-mode-hook ()
	(set (make-local-variable 'company-backends)
		 (list (append common-backends '(
										 company-jedi
										 )))))

  (add-hook 'python-mode-hook 'company-python-mode-hook)
  )

(use-package company-quickhelp
  :ensure t
  :config
  (setq company-quickhelp-delay 2)
  (company-quickhelp-mode 1)
  )

(use-package company-ycmd
  :ensure t
  :disabled
  :config
  (company-ycmd-setup)
  )

(use-package company-irony
  :ensure t
  :disabled
  :config
  )

(provide 'company_conf)
