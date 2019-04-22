;;; package --- summary ssh configure
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package tramp
  :config
  (customize-set-variable 'tramp-verbose 6 "Enable remote command traces")
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

;; (use-package ssh-deploy
;;   :ensure t
;;   )

(use-package ssh-file-modes
  :ensure t
  )

(use-package ssh-config-mode
  :ensure t
  :mode "\\.sconf$"
  )

(provide 'ssh-cfg)
;;; ssh-cfg.el ends here
