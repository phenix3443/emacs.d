; Time-stamp: <2014-08-15 15:08:38 chengxu70>
;; 该文件内容由于初始化顺序的原因只能放在init.el中
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

; 5 Enter Emacs
(setq inhibit-startup-message t)

;; 21.8 Fonts
(require 'cl)
(defun font-candidate (&rest fonts)
  "Return existing font which first match."
  (cl-find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(let ((en-font (font-candidate "DejaVu Sans Mono-14" "Consolas-14")) 
      (zh-font (font-candidate "Microsoft Yahei-14" "文泉驿微米黑 14")))
  ; set en-font
  (setq default-frame-alist 
		(list '(alpha 100 50)
			  (cons 'font en-font)))
  ; set zh-font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font "fontset-default" charset zh-font)))

; 22 international character set support
;(set-language-environment 'utf-8)
(setq buffer-file-coding-system 'utf-8)
;(set-default-coding-systems 'utf-8)
;(prefer-coding-system 'utf-8)


;加载配置文件，按照 Emacs Manual 章节顺序 
(defun load-package-init-files()
	"load most packages init files"
	(let ((default-directory "~/.emacs.d/lisps"))
	  (normal-top-level-add-to-load-path '(".." "."))
	  (normal-top-level-add-subdirs-to-load-path))
	(require 'misc)
	(require 'packages-conf) ;47
	(require 'init-auto-compile)
	(require 'minibuffer-conf) ; 8
	(require 'killing-conf) ; 12
	(require 'display-conf) ; 14
	(require 'files-conf) ; 18
	(require 'frames-conf) ; 21
	(require 'indentation-conf) ; 24
	(require 'text-conf) ; 25
	(require 'program-conf) ; 26
	(require 'customization-conf) ; 48
	)
(add-hook 'after-init-hook 'load-package-init-files)
