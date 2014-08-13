; Time-stamp: <2014-08-14 01:17:52 phenix>

;; 26.1 major mode for programming languages

;;; 26.4.3 matching parentheses
(show-paren-mode t)
(electric-pair-mode t)

;; 26.8 Completion for symbol names
(require 'init-yasnippet)
; auto-complete configure
;(require 'init-popwin)
;(require 'init-company)
(require 'init-auto-complete)

; 28 tags
;(require 'init-xcscope)
(require 'init-helm-gtags)

;; project support
(require 'init-cedet)
(require 'init-projectile)

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
