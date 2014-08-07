;;Time-stamp: <2014-08-08 00:18:19 phenix>

(setq default-directory "~/.emacs.d/")

(defconst is-gnu-os (equal system-type 'gnu) "GNU Hurd system")
(defconst is-gnu-linux-os (equal system-type 'gnu/linux) "GNU/Linux system")
(defconst is-gnu-kfreebsd-os (equal system-type 'gnu/kfreebsd) "GNU system with a FreeBSD kernel")
(defconst is-darwin-os (equal system-type 'darwin) "Darwin")
(defconst is-ms-dos-os (equal system-type 'ms-dos) "MS-DOS system")
(defconst is-windows-nt-os (equal system-type 'windows-nt) "native win32 application")
(defconst is-cygwin-os (equal system-type 'cygwin) "cygwin")

(cond (is-gnu-os ())
      (is-gnu-linux-os ())
      (is-gnu-kfreebsd-os ())
      (is-darwin-os())
      (is-ms-dos-os ())
      (is-windows-nt-os())
      (cygmin-os ()))

; 5 Eenter Emacs
(setq inhibit-startup-message t)
; 6 Exiting Emacs

; 
(defun load-package-init-files()
	"load most packages init files"
	(let ((default-directory "~/.emacs.d/lisps"))
		(normal-top-level-add-to-load-path '(".." "."))
		(normal-top-level-add-subdirs-to-load-path))
	(require 'misc)
	(require 'init-elpa)
	(require 'init-basic)
	(require 'init-minibuffer)
	(require 'init-killing)
	(require 'init-display)
	(require 'init-file-handle)
	(require 'init-frames)
	(require 'init-indentation)
	(require 'init-invocation)
	(require 'init-desktop)
	(require 'init-program)
	(require 'init-text)
	(require 'init-international)
	(require 'init-color-theme)
	(require 'init-org)
	(require 'init-org2blog)
	)
(add-hook 'after-init-hook 'load-package-init-files)


