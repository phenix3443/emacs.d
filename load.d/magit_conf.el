;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package magit
  :ensure t
  :bind ([f8] . magit-status)
  :config
  (require 'find-func)
  (with-eval-after-load 'info
	(info-initialize)
	(add-to-list 'Info-directory-list (file-name-directory (find-library-name "magit"))))
  )

(provide 'magit_conf)