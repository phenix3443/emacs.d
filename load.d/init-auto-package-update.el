;; -*- coding:utf-8; -*-

(require 'use-package)
(use-package auto-package-update
  :ensure t
  :config
  ;; updata installed package at startup
  ;; (auto-package-update-maybe)

  ;; set update time
  ;; (auto-package-update-at-time "10:00")

  ;; update interval
  (setq auto-package-update-interval 3)

  ;; delete old unuseful version package
  (setq auto-package-update-delete-old-versions t)

  (add-hook 'auto-package-update-before-hook
			(lambda () (message "I will update packages now")))

  ;; (add-hook 'auto-package-update-after-hook ())
          
  )
