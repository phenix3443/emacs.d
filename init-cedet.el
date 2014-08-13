;;Time-stamp: <2014-08-14 01:14:40 phenix>
(require 'cedet)

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
;;;ede
(setq ede-local-setup-options '(ede-local-global 
								ede-local-base))

;;;semantic configures
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
(when (cedet-gnu-global-version-check t)
  ;; Configurations for GNU Global and CEDET
  (semanticdb-enable-gnu-global-databases 'c-mode t)
  (semanticdb-enable-gnu-global-databases 'c++-mode t))

; srecode
; (global-srecode-minor-mode 1)

(add-hook 'prog-mode-hook
		  '(lambda () 
			 (global-ede-mode 1)
			 (semantic-mode 1)
			 (semantic-show-parser-state-mode 1)
			 (semantic-show-unmatched-syntax-mode 1)
			 (semantic-highlight-edits-mode (if is-windows-nt-os 1 -1))))

(provide 'init-cedet)

