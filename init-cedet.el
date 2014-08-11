;;Time-stamp: <2014-08-11 15:25:18 chengxu70>
(require 'cedet)

(defconst cedet-sys-include-dirs (list
								  "/usr/include/"
								  "/usr/include/gnu"
								  "/usr/local/include"
								  ))
(defconst cedet-user-include-dirs (list 
								   ".."
								   "../include"
								   "../inc"
								   "../common"
								   "../public"
								   "../.."
								   "../../include"
								   "../../inc"
								   "../../common"
								   "../../public"))
;;;ede
(setq ede-local-setup-options '(ede-local-global ede-local-base))

;;;semantic configures
(setq semantic-default-submodes '(global-semanticdb-minor-mode
								  global-semantic-mru-bookmark-mode
								  global-semantic-highlight-func-mode
								  global-semantic-decoration-mode
								  global-semantic-idle-local-symbol-highlight-mode
								  global-semantic-idle-scheduler-mode
                                  global-semantic-idle-summary-mode
								  global-semantic-idle-completions-mode
								  ;global-semantic-stickyfunc-mode
                                  ))

; set for c/c++ on windows nt os


; srecode
; (global-srecode-minor-mode 1)

(provide 'init-cedet)

