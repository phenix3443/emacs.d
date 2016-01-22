;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package header2
  :ensure t
  :disabled t
  :config
  ;; update file headers when save a file
  (autoload 'auto-update-file-header "header2")
  (add-hook 'write-file-hooks 'auto-update-file-header)
  ;; add a file headers when create a new file
  (autoload 'auto-make-header "header2")
  (add-hook 'emacs-lisp-mode-hook 'auto-make-header)
  )
(provide 'init-header2)
