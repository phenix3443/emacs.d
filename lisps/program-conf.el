;; Time-stamp: <2014-08-14 01:17:52 phenix>

;; 26.1 major mode for programming languages

;; 26.4.3 matching parentheses
(show-paren-mode t)
(electric-pair-mode t)

;; 26.8 Completion for symbol names
(require 'init-yasnippet)
;; auto-complete configure
;;(require 'init-popwin)
;;(require 'init-company)
(require 'init-auto-complete)
;; 27.5 Finding Syntax Error on The Fly
(require 'init-flycheck)

;; 28 tags
(require 'init-helm-gtags)

;; project support
(require 'init-cedet)
(require 'init-projectile)

;; 高亮/替换同名变量
(require-package 'auto-highlight-symbol)
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(global-set-key (kbd "C-c p h") 'ahs-edit-mode)
;; C mode
(add-hook 'c-mode-hook
		  '(lambda()
			 (c-set-style "linux")
			 (setq c-basic-offset 4)))
;;c-indent-comment-alist
;; C++ mode
(add-hook 'c++-mode-hook
		  '(lambda()
			 (c-set-style "linux")
			 (setq c-basic-offset 4)))

;; Lua mode
(require-package 'lua-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 4)

(provide 'program-conf)
