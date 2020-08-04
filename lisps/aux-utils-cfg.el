;;; package --- summary  辅助功能设置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode))

(use-package helm-descbinds
  :after (helm)
  :ensure t
  :config
  (helm-descbinds-mode))

(use-package restart-emacs
  :ensure t
  :config
  )

(use-package google-this
  :ensure t
  :diminish
  :config
  (google-this-mode))


(use-package bash-completion
  :ensure t
  :disabled t
  :config
  (bash-completion-setup)
  )

(use-package helm-system-packages
  :ensure t
  :config
  (require 'em-tramp)
  (setq password-cache t)
  (setq password-cache-expiry 3600)
  )

(provide 'aux-utils-cfg)
;;; aux-utils-cfg.el ends here
