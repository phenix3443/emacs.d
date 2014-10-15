; Time-stamp: <2014-08-27 10:11:18 chengxu70>
; required by text-conf.le

(require-package 'org)
(require-package 'cdlatex)
(require-package 'htmlize)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

(setq org-startup-folded nil)
(setq org-list-indent-offset 2)
(provide 'init-org)
