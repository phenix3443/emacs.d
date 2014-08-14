; Time-stamp: <2014-08-14 23:57:25 phenix>
(require 'cedet)
(require 'cedet-cscope)
(require 'cedet-files)
(require 'cedet-global)
(require 'cedet-idutils)

; global support
(setq cedet-global-command "gtags")
			 
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
								   "../../Common"
								   "../../public"))
; ede
(setq ede-local-setup-options '(ede-local-global 
								ede-local-base))
;(add-hook 'prog-mode-hook 'global-ede-mode)
		 
; semantic configures
(setq semantic-default-submodes '(global-semanticdb-minor-mode
								  global-semantic-decoration-mode
								  ;global-semantic-highlight-func-mode
								  global-semantic-idle-local-symbol-highlight-mode
								  global-semantic-idle-scheduler-mode
                                  ;global-semantic-idle-summary-mode
								  ;global-semantic-idle-completions-mode
								  ;global-semantic-mru-bookmark-mode
								  ;global-semantic-stickyfunc-mode
                                  ))


(add-hook 'prog-mode-hook
		  (lambda () 
			 (semantic-mode 1)
			 (when (cedet-gnu-global-version-check t)
			   (semanticdb-enable-gnu-global-databases 'c-mode t)
			   (semanticdb-enable-gnu-global-databases 'c++-mode t))))	
; srecode
;(add-hook 'prog-mode-hook '(lambda()
;							 (global-srecode-minor-mode 1)))


(provide 'init-cedet)

