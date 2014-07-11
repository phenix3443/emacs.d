;;---------------------------------------------------------------------
;;Environment
;;---------------------------------------------------------------------
(setq default-directory "~/.emacs.d/")
;;---------------------------------------------------------------------
;;different OS configures
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
(setq frame-title-format '("%*" " " "%f"))
(tool-bar-mode -1)

;;mode line
(display-time-mode 1)
(setq display-time-format "%D %a %H:%M")

;;color theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisps")
;(load-theme 'wombat t)

;trasparent
;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
(transparency 100)
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
;;require packages and load their init files
;;----------------------------------------------------------------------
(defun load-package-init-files()
	"load most packages init files"
	(let ((default-directory "~/.emacs.d/lisps"))
		(normal-top-level-add-to-load-path '(".." "."))
		(normal-top-level-add-subdirs-to-load-path))
	(require 'init-auto-complete)
	(require 'init-elpa)
	(require 'init-popwin)
	(require 'init-yasnippet)
	(require 'color-theme-sanityinc-tomorrow)
	(color-theme-sanityinc-tomorrow-eighties)
	)
(add-hook 'after-init-hook 'load-package-init-files)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes (quote ("58fb295e041032fd7a61074ca134259dfdef557ca67d37c4240dbfbb11b8fcc7" "191a1493fc7c3252ae949cc42cecc454900e3d4d1feb96f480cf9d1c40c093ee" "cc49acc055b77f0bedf68cc6ce20aad47925b5c2675754fea2507975135a5bf9" "8b9d07b01f2a9566969c2049faf982cab6a4b483dd43de7fd6a016bb861f7762" default)))
 '(fci-rule-color "#2a2a2a")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#d54e53") (40 . "#e78c45") (60 . "#e7c547") (80 . "#b9ca4a") (100 . "#70c0b1") (120 . "#7aa6da") (140 . "#c397d8") (160 . "#d54e53") (180 . "#e78c45") (200 . "#e7c547") (220 . "#b9ca4a") (240 . "#70c0b1") (260 . "#7aa6da") (280 . "#c397d8") (300 . "#d54e53") (320 . "#e78c45") (340 . "#e7c547") (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
