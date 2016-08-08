;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package guide-key
  :ensure t
  :config
  (setq guide-key/guide-key-sequence t)

  (setq guide-key/highlight-command-regexp
		'("rectangle"
		  ("register" . font-lock-type-face)
		  ("bookmark" . "hot pink")))

  (setq guide-key/idle-delay 0.5)

  (setq guide-key/recursive-key-sequence-flag t)

  (setq guide-key/popup-window-position 'bottom)

  (guide-key-mode 1)
  )
(provide 'guide_key_conf)
