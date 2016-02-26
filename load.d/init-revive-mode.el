;; -*- coding:utf-8; -*-

(require 'use-package)
(use-package revive
  :ensure t
  :config
  (autoload 'save-current-configuration "revive" "Save status" t)
  (autoload 'resume "revive" "Resume Emacs" t)
  (autoload 'wipe "revive" "Wipe Emacs" t)

  ;; (define-key ctl-x-map "S" 'save-current-configuration)
  ;; (define-key ctl-x-map "F" 'resume)
  ;; (define-key ctl-x-map "K" 'wipe)
  )

(provide 'init-revive-mode)
