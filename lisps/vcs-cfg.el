;;; package --- summary  版本控制（version control）相关配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package magit
  :ensure t
  :config
  (require 'find-func)
  (info-initialize)
  (add-to-list 'Info-directory-list
               (file-name-directory (find-library-name "magit"))))


(use-package gitignore-mode
  :ensure t
  :config
)

(provide 'vcs-cfg)
;;; vcs-cfg.el ends here
