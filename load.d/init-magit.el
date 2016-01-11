(require 'req-package)
(req-package magit
  :config
  (require 'find-func)
  (with-eval-after-load 'info
	(info-initialize)
	(add-to-list 'Info-directory-list (file-name-directory (find-library-name "magit"))))
  )

(provide 'init-magit)
