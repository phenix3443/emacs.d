; Time-stamp: <2014-08-11 21:19:52 chengxu70>
(require-package 'company)

(require 'company)

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

(add-hook 'prog-mode-hook '(lambda()
							 (company-mode t)))
(provide 'init-company)

