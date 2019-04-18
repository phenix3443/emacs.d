;;; package --- summary  ssh configure
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package ssh-config-mode
  :ensure t
  :mode "\\.sconf\\'"
  )

(use-package tramp
  :config
  (customize-set-variable 'tramp-verbose 6 "Enable remote command traces")
  ;; (add-to-list 'tramp-default-proxies-alist
  ;;              '("tw06116" nil "/ssh:essh:| %h"))

  )

(use-package helm-tramp
  :ensure t
  :after (helm tramp)
  :config
  )

(use-package docker-tramp
  :ensure t
  :after (tramp)
  :config
  )

(use-package kubernetes-tramp
  :ensure t
  :after (tramp)
  :config
  )

(use-package magit-tramp
  :ensure t
  :after (tramp)
  :config
  )

(provide 'ssh-cfg)

;;; ssh-cfg.el ends here
