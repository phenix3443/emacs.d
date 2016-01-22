;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package multiple-cursors
  :ensure t
  :disabled t
  :config
  (global-set-key (kbd "C-c m e") 'mc/edit-lines)
  (global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
  )
(provide 'init-multiple-cursors)
