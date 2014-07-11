;;---------------------------------------------------------------------
;;Environment
;;---------------------------------------------------------------------

;add subdirs of ~/.emacs.d/ to load-path
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
(defconst is_gnu_os (equal system-type 'gnu) "GNU Hurd system")
(defconst is_gnu_linux_os (equal system-type 'gnu/linux) "GNU/Linux system")
(defconst is_gnu_kfreebsd_os (equal system-type 'gnu/kfreebsd) "GNU system with a FreeBSD kernel")
(defconst is_darwin_os (equal system-type 'darwin) "Darwin")
(defconst is_ms_dos_os (equal system-type 'ms-dos) "MS-DOS system")
(defconst is_windows_nt_os (equal system-type 'windows-nt) "native win32 application")
(defconst is_cygwin_os (equal system-type 'cygwin) "cygwin")

(cond (is_gnu_os ())
      (is_gnu_linux_os ())
      (is_gnu_kfreebsd_os ())
      (is_darwin_os())
      (is_ms_dos_os ())
      (is_windows_nt_os())
      (cygmin-os ()))

;;---------------------------------------------------------------------
;;custom view
;;---------------------------------------------------------------------
;hide the welcome screen in Emacs
(setq inhibit-startup-message t)
;hide scroll bar
(set-scroll-bar-mode nil) 
;frame
(setq frame-title-format (list "Emacs " emacs-version))
(tool-bar-mode -1)

;;mode line
(display-time-mode 1)
(setq display-time-format "%D %a %H:%M")

;;color theme
(load-theme 'wombat t)

;;----------------------------------------------------------------------
;;text edit
;;----------------------------------------------------------------------

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

;;----------------------------------------------------------------------
;;require module
;;----------------------------------------------------------------------
(require 'init-elpa)
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

;;----------------------------------------------------------------------
;;Lua mode
;;----------------------------------------------------------------------

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
    (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
    (add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
;----------------------------------------------------------------------
