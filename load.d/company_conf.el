;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-minimum-prefix-length 1)
  (setq company-global-modes t)

  (use-package company-quickhelp
	:ensure t
	:config
	(setq company-quickhelp-delay 2)
	(company-quickhelp-mode 1)

	)

  (use-package company-ycmd
  	:ensure t
  	:disabled t
  	:config
  	(company-ycmd-setup)
  	)

  (use-package company-irony
	:ensure t
	:config
	)

  (setq common-backends '(
						  company-capf
						  company-dabbrev
						  company-dabbrev-code
						  company-files
						  company-gtags
						  company-keywords
						  company-yasnippet
						  ))

  ;; (defun company-c/c++-mode-setup ()
  ;; 	(set (make-local-variable 'company-backends)
  ;; 		 (list (append common-backends
  ;; 					   '(company-irony-c-headers  company-irony)))))

  ;; (add-hook 'c-mode-hook 'company-c/c++-mode-setup)
  ;; (add-hook 'c++-mode-hook 'company-c/c++-mode-setup)

  (defun company-elisp-mode-setup ()
  	(set (make-local-variable 'company-backends) (list (append common-backends '(company-elisp)))))

  (add-hook 'emacs-lisp-mode-hook 'company-elisp-mode-setup)

  (use-package company-lua
  	:ensure t
	)

  (defun company-lua-mode-setup ()
	(set (make-local-variable 'company-backends) (list (append common-backends '(company-lua)))))

  (add-hook 'lua-mode-hook 'company-lua-mode-setup)

  (use-package company-jedi
	:ensure t
	:config
	)
  (defun company-python-mode-hook ()
	(set (make-local-variable 'company-backends) (list (append common-backends '(company-jedi)))))

  (add-hook 'python-mode-hook 'company-python-mode-hook)

  (defun company-ruby-mode-hook ()
	(set (make-local-variable 'company-backends) (list (append common-backends '()))))


  )


(provide 'company_conf)
