;; -*- coding:utf-8; -*-
(require 'use-package)

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/no-confirm-load-theme t)
  (setq sml/shorten-directory t)
  (setq sml/shorten-modes t)
  (setq rm-excluded-modes (list " company"
								" hs"
								" yas"
								" ElDoc"
								" Guide"
								" Helm"
								" HelmGtags"
								" HS"
								" Paredit"
								" Wrap"
								))

  (add-to-list 'sml/replacer-regexp-list '("^~/gitlab/org-note/" ":note:"))
  (sml/setup)
  )

(provide 'restart_emacs_conf)
