;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package company
  :ensure t
  :defer t
  :init (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay .3)
  (setq company-echo-delay 0)
  (setq company-begin-commands '(self-insert-command))

  ;; (setq company-minimum-prefix-length 2)
  ;; :bind ("C-;" . company-complete-common)
  (defun company-prog-mode-setup ()
	(add-to-list 'company-backends 'company-gtags)
	(add-to-list 'company-backends 'company-yasnippet)
	)

  (add-hook 'prog-mode-hook 'company-prog-mode-setup)

  (defun compnay-c-mode-setup ()
	(add-to-list 'company-backends 'company-irony)
	)

  (add-hook 'c-mode-hook 'company-c-mode-setup)


  (defun company-elisp-mode-setup ()
	(add-to-list 'company-backends 'company-elisp)
	)

  (add-hook 'elisp-mode-hook 'company-elisp-mode-setup)

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
  	:disabled t
  	:config
  	(require 'company-ycmd)
  	(company-ycmd-setup)
  	)

  (use-package company-irony-c-headers	:ensure t
	;; :disabled t
	:config
	(eval-after-load 'company
	  '(add-to-list
		'company-backends 'company-irony-c-headers))
	)

  (use-package company-irony
	:ensure t
	;; :disabled t
	:defer t
	:config
	(eval-after-load 'company
	  '(add-to-list 'company-backends 'company-irony))
	)
  )

(provide 'init-company)
