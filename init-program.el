;;Time-stamp: <2014-08-01 22:19:56 chengxu70>

(require 'init-cedet)
;; 26.4.3 matching parentheses
(show-paren-mode t)
(electric-pair-mode t)

;; 26.8 Completion for symbol names
(require 'init-yasnippet)
(require 'init-popwin)
(require 'init-auto-complete)
;(require 'init-company)

(provide 'init-program)
