(require 'req-package)
(req-package company
  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)

  (setq company-backends
		'(company-gtags
		  company-yasnippet
		  company-files
		  company-dabbrev
		  company-dabbrev-code
		  company-etags
		  company-semantic
		  company-elisp
		  ))

  (require-package 'company-c-headers)
  (require 'company-c-headers)
  (add-to-list 'company-c-headers-path-system "usr/include/c++")
  (add-to-list 'company-backends 'company-c-headers)

  (add-hook 'prog-mode-hook '(lambda()
							   (company-mode t)))
  )
(provide 'init-company)
