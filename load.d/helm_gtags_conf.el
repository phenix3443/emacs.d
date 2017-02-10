;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package helm-gtags
  :ensure t
  :init
  (custom-set-variables
   '(helm-gtags-prefix-key "\C-c g")
   '(helm-gtags-suggested-key-mapping t))
  :config
  (add-hook 'prog-mode-hook 'helm-gtags-mode)

  (custom-set-variables
   '(helm-gtags-parse-file 'root)
   '(helm-gtags-ignore-case t)
   '(helm-gtags-read-only t)
   '(helm-gtags-use-input-at-cursor t)
   '(helm-gtags-highlight-candidate t)
   '(helm-gtags-display-style 'detail)
   '(helm-gtags-auto-update t)
   '(helm-gtags-update-interval-second 60)
   '(helm-gtags-cache-select-result t)
   '(helm-gtags-pulse-at-cursor t)
   '(helm-gtags-fuzzy-match nil)
   '(helm-gtags-direct-helm-completing t)
   )
  )

(provide 'helm_gtags_conf)
