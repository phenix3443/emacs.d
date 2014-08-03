;;Time-stamp: <2014-08-04 00:14:09 phenix>


;; 26.4.3 matching parentheses
(show-paren-mode t)
(electric-pair-mode t)

;; 26.8 Completion for symbol names
(require 'init-yasnippet)
(require 'init-popwin)
(require 'init-auto-complete)
;(require 'init-company)


;;project support
(require 'init-cedet)
(require 'init-cscope)

(provide 'init-program)
