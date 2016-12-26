;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package contab-mode
  :ensure t
  :disabled t
  :config
  (add-to-list 'auto-mode-alist '("\\.cron\\(tab\\)?\\'" . crontab-mode))
  (add-to-list 'auto-mode-alist '("cron\\(tab\\)?\\."    . crontab-mode))
  )
