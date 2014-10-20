; Time-stamp: <2014-08-27 10:11:18 chengxu70>
; required by text-conf.el, from org manual

(require-package 'org)
(require-package 'cdlatex)
(require-package 'htmlize)

(require 'org)
(require 'cdlatex)
(require 'htmlize)

;; 14.2 Editing source code
(add-to-list 'org-src-lang-modes
			 '("xml" . nxml)
			 '("Shell" . sh))
(setq org-src-window-setup 'reorganize-frame)
(setq org-src-preserve-indentation nil)
(setq org-src-ask-before-returning-to-edit-buffer t)
(setq org-src-fontify-natively t)

(global-set-key "\C-c'" 'org-src-mode)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)


(setq org-startup-folded nil)
(setq org-list-indent-offset 2)
(provide 'init-org)
