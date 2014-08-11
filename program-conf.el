; Time-stamp: <2014-08-11 15:26:49 chengxu70>

;;; 26.4.3 matching parentheses
(show-paren-mode t)
(electric-pair-mode t)

;; 26.8 Completion for symbol names
(require 'init-cscope)
(require 'init-yasnippet)

; auto-complete configure
(require 'init-popwin)
;(require 'init-auto-complete)

(require 'init-company)

;; project support
(require 'init-cedet)


;; 26.1 major mode for programming languages
(add-hook 'prog-mode-hook
		  (lambda () 
			"add common modes for program"
			
			; turn on xcscope
			; turn on ggtags
			; turn on semantic
			;(semantic-mode 1)
			;(semantic-show-parser-state-mode 1)
			;(semantic-show-unmatched-syntax-mode 1)
			;(semantic-highlight-edits-mode (if is-windows-nt-os 1 -1))
			
			; turn on auto-complete mode
			(auto-complete-mode t)
			
			; turn on company mode
			;(company-mode t)
			
			; turn on projectile
			(projectile-mode t)
			))

; C mode
(add-hook 'c-mode-hook
		  '(lambda()
			 (c-set-style "linux")
			 (setq c-basic-offset 4)))
; C++ mode
(add-hook 'c++-mode-hook
		  '(lambda()
			 (c-set-style "linux")
			 (setq c-basic-offset 4)))

; Lua mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
    (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
    (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(provide 'program-conf)
