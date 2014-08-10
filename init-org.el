; Time-stamp: <2014-08-10 17:07:18 phenix>
(require 'org)
(require 'cdlatex)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

(provide 'init-org)
