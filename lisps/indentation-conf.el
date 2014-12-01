;;;Time-stamp: <2014-08-08 12:33:43 chengxu70>
;;24.3 Tabs vs Spaces
(add-hook 'prog-mode-hook
		  '(lambda()
			 (setq tab-width 4)))
;;24.4 convenience feature for indentation
(setq tab-always-indent 'complete)
(provide 'indentation-conf)

