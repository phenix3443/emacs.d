; Time-stamp: <2014-08-07 18:37:47 chengxu70>
(require 'company)

(global-company-mode t)
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
(provide 'init-company)

