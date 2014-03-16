;;---------------------------------------------------------------------
;;Environment
;;---------------------------------------------------------------------

;;add subdirs of ~/.emacs.d/ to load-path
(let ((default-directory "~/.emacs.d/"))
  (setq load-path 
	(append
	 (let ((load-path (copy-sequence load-path)))
         (append (copy-sequence (normal-top-level-add-to-load-path '(".")))
         (normal-top-level-add-subdirs-to-load-path)))
	 load-path)))
;;---------------------------------------------------------------------
;;Startup
;;---------------------------------------------------------------------
(require 'init-startup)

;(require 'init-fonts)

(global-set-key (kbd "C-SPC") 'nil)
(global-set-key (kbd "S-SPC") 'set-mark-command)

(set-scroll-bar-mode nil) ;hide scroll bar
(global-linum-mode t) ;display line number
(column-number-mode t) ;display column number

(global-hl-line-mode t) ;auto highlight
(global-visual-line-mode t) ;line wrap in screen line
(mouse-avoidance-mode 'animate) ;make mouse away from point

(setq track-eol t) ;
(setq x-select-enable-clipboard t)

(setq-default cursor-type 'bar) ; 
(fset 'yes-or-no-p 'y-or-n-p) ;

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(setq-default tab-width 4)
(show-paren-mode t)
(electric-pair-mode t)


(require 'init-yasnippet)
(require 'init-auto-complete)
(require 'init-popwin)

;;----------------------------------------------------------------------
;;init c/C++ mode
;;----------------------------------------------------------------------
(add-hook 'c-mode-hook
		  '(lambda()
			 (c-set-style "linux")
			 (setq c-basic-offset 4)))



(add-hook 'c++-mode-hook
		  '(lambda()
			 (c-set-style "linux")
			 (setq c-basic-offset 4)))
;----------------------------------------------------------------------

;;----------------------------------------------------------------------
;;Lua mode
;;----------------------------------------------------------------------

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
    (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
    (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;----------------------------------------------------------------------


