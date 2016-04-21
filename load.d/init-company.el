;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package company
  :ensure t
  ;; :disabled t
  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)

  (setq company-backends (append '(company-yasnippet company-elisp) company-backends))

  (use-package helm-company
	:ensure t
	:disabled t
	:config)

  (use-package company-c-headers
	:ensure t
	:config
	(require 'company-c-headers)
	;; (add-to-list 'company-c-headers-path-system "/usr/include/c++")
	(add-to-list 'company-backends 'company-c-headers)
	)


  (use-package company-lua
	:ensure t
	:config
	(require 'company-lua)
	(add-to-list 'company-backends 'company-lua)
	)

  (use-package company-quickhelp
	:ensure t
	;; :disabled t
	:config
	(company-quickhelp-mode 1)
	(eval-after-load 'company
	  '(define-key company-active-map (kbd "M-h") #'company-quickhelp-manual-begin))
	)

  (use-package company-ycmd
	:ensure t
	:disabled t
	:config
	(company-ycmd-setup)
	)


  (add-hook 'after-init-hook 'global-company-mode)
  )
(provide 'init-company)
