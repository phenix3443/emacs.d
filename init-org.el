; Time-stamp: <2014-08-20 00:24:49 phenix>
(require 'org)
(require 'cdlatex)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

(setq org-startup-folded nil)
(setq org-list-indent-offset 2)
(provide 'init-org)
