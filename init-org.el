;;Time-stamp: <2014-07-31 16:03:54 chengxu70>
(require 'org)
(require 'cdlatex)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-org-cdlatex)
(provide 'init-org)
