;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package company
  :ensure t
  :disabled t

  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-backends (append '(company-yasnippet company-elisp) company-backends))

  (add-hook 'after-init-hook 'global-company-mode)


  (use-package company-c-headers
  	:ensure t
  	:disabled t
  	:config
  	(require 'company-c-headers)
	(add-to-list 'company-c-headers-path-system "/usr/include/c++")
	(defun company-c-header-setup ()
	  (add-to-list 'company-backends 'company-c-headers))
	(add-hook 'c-mode-hook 'company-c-header-setup)
  	)


  (use-package company-lua
  	:ensure t
  	:disabled t
  	:config
  	(require 'company-lua)
	(defun company-lua-mode-setup ()
	    	(add-to-list 'company-backends 'company-lua))
	(add-hook 'lua-mode-hook 'company-lua-mode-setup)
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
  	;; :disabled t
  	:config
  	(require 'company-ycmd)
  	(company-ycmd-setup)
  	)
  )

(provide 'init-company)
