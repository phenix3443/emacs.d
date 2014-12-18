;;;Time-stamp: <2014-08-27 09:57:06 chengxu70>
;;;该文件内容由于初始化顺序的原因只能放在init.el中

;; 方便调试
;;(setq debug-on-error t)

(setq default-directory "~/.emacs.d/")

(defconst is-gnu-os (equal system-type 'gnu) "GNU Hurd system")
(defconst is-gnu-linux-os (equal system-type 'gnu/linux) "GNU/Linux system")
(defconst is-gnu-kfreebsd-os (equal system-type 'gnu/kfreebsd) "GNU system with a FreeBSD kernel")
(defconst is-darwin-os (equal system-type 'darwin) "Darwin")
(defconst is-ms-dos-os (equal system-type 'ms-dos) "MS-DOS system")
(defconst is-windows-nt-os (equal system-type 'windows-nt) "native win32 application")
(defconst is-cygwin-os (equal system-type 'cygwin) "cygwin")

(when (equal system-type 'windows-nt)
	 (setenv "GTAGSCONF" (concat (getenv "HOME") "\\.emacs.d\\win_apps\\glo633wb\\share\\gtags\\gtags.conf"))
	 (setenv "GTAGSLABEL" "pygments")
	 (add-to-list 'exec-path (list
							  ;;(concat (getenv "emacs_dir") "/bin/")
							  ;; 设置exec-path要使用绝对路径，只在windows8上可用
							  (concat (getenv "HOME") "\\.emacs.d\\win_apps\\")
							  (concat (getenv "HOME") "\\.emacs.d\\win_apps\\glo633wb\\bin\\")
							  (concat (getenv "HOME") "\\.emacs.d\\win_apps\\lua-5.2.3_Win32_bin\\"))))

;; use proxy for internet
;; (setq url-proxy-services
	  ;; '(
		;; ("http" . "127.0.0.1:8087")
		;; ("https" . "127.0.0.1:8087")))

;;加载配置文件，按照 Emacs Manual 章节顺序 
(defun load-package-init-files()
  "load most packages init files"
  (let ((default-directory "~/.emacs.d/lisps"))
	(normal-top-level-add-to-load-path '("."))
	(normal-top-level-add-subdirs-to-load-path))
  (require 'misc-conf)
  (require 'packages-conf)				;47
  (require 'minibuffer-conf)			;8
  (require 'killing-conf)				;12
  (require 'display-conf)				;14
  (require 'files-conf)					;18
  (require 'window-conf)				;20
  (require 'frames-conf)				;21
  (require 'indentation-conf)			;24
  (require 'text-conf)					;25
  (require 'program-conf)				;26
  (require 'compile-test-conf)			;27
  (require 'vc-conf)					;28
  (require 'customization-conf)			;48
  )
(add-hook 'after-init-hook 'load-package-init-files)
