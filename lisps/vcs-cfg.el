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


(use-package git-link
  :ensure t
  :custom
  (git-link-open-in-browser t)
  )

(use-package gitattributes-mode
  :ensure t
  )

(use-package gitconfig-mode
  :ensure t
  )

(use-package gitignore-mode
  :ensure t
  :config
  )

(use-package gitlab-ci-mode
  :ensure t
  )

(use-package gitlab-ci-mode-flycheck
  :ensure t
  :after flycheck gitlab-ci-mode
  :init
  (gitlab-ci-mode-flycheck-enable)
  )

(use-package gist
  :ensure t
  :config
  )

(use-package vc-msg
  :ensure t
  )

(provide 'vcs-cfg)
;;; vcs-cfg.el ends here
