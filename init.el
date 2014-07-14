;;Time-stamp: <2014-07-14 14:42:00 chengxu70>
;;---------------------------------------------------------------------
;;different OS configures
;;---------------------------------------------------------------------
(setq default-directory "~/.emacs.d/")

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
(setq inhibit-startup-message t)
(global-linum-mode t) 
(fset 'yes-or-no-p 'y-or-n-p) ;

;;----------------------------------------------------------------------
;;require packages and load their init files
;;----------------------------------------------------------------------
(defun load-package-init-files()
	"load most packages init files"
	(let ((default-directory "~/.emacs.d/lisps"))
		(normal-top-level-add-to-load-path '(".." "."))
		(normal-top-level-add-subdirs-to-load-path))
	(require 'misc)
	(require 'init-auto-complete)
	(require 'init-basic)
	(require 'init-display)
	(require 'init-elpa)
	(require 'init-file-handle)
	(require 'init-frames)
	(require 'init-indentation)
	(require 'init-invocation)
	(require 'init-killing)
	(require 'init-desktop)

	(require 'init-popwin)
	(require 'init-program)
	(require 'init-text)
	(require 'init-yasnippet)
	(require 'init-color-theme)
	(require 'init-org2blog)
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
