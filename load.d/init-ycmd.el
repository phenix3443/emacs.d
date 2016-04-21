;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package ycmd
  :ensure t
  ;; :disabled t
  :config
  (require'ycmd)
  (add-hook 'after-init-hook #'global-ycmd-mode)
  (set-variable 'ycmd-server-command '("python"))
  (add-to-list  'ycmd-server-command (expand-file-name "~/.emacs.d/3rd-party/ycmd/ycmd/"))

  ;; (set-variable 'ycmd-global-config "/path/to/global_config.py")
  ;; (set-variable'ycmd-extra-conf-whitelist '("~/.emacs.d/3rd-party/ycmd/cpp/ycm/.ycm_extra_conf.py"))
  )

(provide 'init-ycmd)
