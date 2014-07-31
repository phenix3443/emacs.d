;;Time-stamp: <2014-07-31 21:03:04 chengxu70>

(require 'init-cedet)
;; 26.4.3 matching parentheses
(show-paren-mode t)
(electric-pair-mode t)

;; 26.8 Completion for symbol names
(require 'init-yasnippet)
(require 'init-popwin)
(require 'init-auto-complete)

(provide 'init-program)
