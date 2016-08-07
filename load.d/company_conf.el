;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package company
  :ensure t
  ;; :bind ("C-;" . company-complete-common)
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)

  (use-package company-c-headers
  	:ensure t
  	:config
  	)

  (use-package company-lua
  	:ensure t
	)

  (use-package company-quickhelp
	:ensure t
	:disabled t
	:config
	(company-quickhelp-mode 1)
	(eval-after-load 'company
	  '(define-key company-active-map (kbd "M-h") #'company-quickhelp-manual-begin))
	)

  (use-package company-ycmd
  	:ensure t
  	:disabled t
  	:config
  	(require 'company-ycmd)
  	(company-ycmd-setup)
  	)

  (use-package company-irony-c-headers
	:ensure t
	;; :disabled t
	:config
	)

  (use-package company-irony
	:ensure t
	;; :disabled t
	:defer t
	:config
	)
  (use-package company-jedi
	:ensure t
	:config
	)

  (defun company-c-mode-setup ()
	(set (make-local-variable 'company-backends) '((company-c-headers company-irony-c-headers  company-irony company-yasnippet company-dabbrev company-dabbrev-code company-keywords company-gtags company-files)) ))

  (add-hook 'c-mode-hook 'company-c-mode-setup)
  (add-hook 'c++-mode-hook 'company-c-mode-setup)

  (defun company-elisp-mode-setup ()
	(set (make-local-variable 'company-backends) '((company-elisp company-dabbrev company-dabbrev-code company-yasnippet company-gtags company-files))))

  (add-hook 'emacs-lisp-mode-hook 'company-elisp-mode-setup)

  (defun company-lua-mode-setup ()
	(set (make-local-variable 'company-backends) '((company-lua company-dabbrev company-dabbrev-code company-gtags company-files))))

  (add-hook 'lua-mode-hook 'company-lua-mode-setup)


  (defun company-python-mode-hook ()
	(set (make-local-variable 'company-backends) '((company-jedi company-dabbrev company-dabbrev-code company-gtags company-files))))

  (add-hook 'python-mode-hook 'company-python-mode-hook)

  (defun company-ruby-mode-hook ()
	(set (make-local-variable 'company-backends) '(company-yasnippet)))
  )

(provide 'company_conf)
