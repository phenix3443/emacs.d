(require 'req-package)
(req-package cc-mode
  :config
  (setq c-default-style '((java-mode . "java")
						  (awk-mode . "awk")
						  (other . "linux")))
  )
(provide 'init-cc-mode)
