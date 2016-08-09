;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package ace-jump-mode
  :ensure t
  :bind (("C-c SPC" . 'ace-jump-mode)
		 ("C-x SPC" . 'ace-jump-mode-pop-mark)
		 )
  :disabled t
  :config

  (eval-after-load "ace-jump-mode"
	'(ace-jump-mode-enable-mark-sync))

  (use-package ace-isearch
	:ensure t
	:config
	(require 'ace-isearch)
	(global-ace-isearch-mode +1)
	)

  (use-package ace-jump-buffer
	:ensure t
	:config)

  (use-package ace-link
	:ensure t
	:config
	(ace-link-setup-default)
	)

  (use-package ace-window
	:ensure t
	:config
	(global-set-key (kbd "M-p") 'ace-window)
	(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
	)
  )


(provide 'ace_jump_mode_conf)
