;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package ace-jump-mode
  :ensure t
  :disabled t
  :config
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
  (eval-after-load "ace-jump-mode"
	'(ace-jump-mode-enable-mark-sync))
  (define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)
  )
(use-package ace-isearch
  :ensure t
  :disabled t
  :config
  (require 'ace-isearch)
  (global-ace-isearch-mode +1)
  )

(use-package ace-jump-buffer
  :ensure t
  :disabled t
  :config)

(use-package ace-link
  :ensure t
  :disabled t
  :config
  (ace-link-setup-default)
  )

(use-package ace-window
  :ensure t
  :disabled t
  :config
  (global-set-key (kbd "M-p") 'ace-window)
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  )

(provide 'init-ace-jump-mode)
