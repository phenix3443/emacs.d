;; -*- coding:utf-8; -*-

;; 7.2 change the location of point
(setq track-eol t)
;; 8.4 Completion
;; 12.3 cut and paste

;; 12.6 CUA
;; 14.3 Automatic Scrolling
(setq scroll-conservatively 10000)
;;(set-face-attribute 'linum nil :height 100)
;; 14.5 narrow
(put 'narrow-to-region 'disabled nil)
;; 14.12 Font Lock mode
(add-hook 'prog-mode-hook 'font-lock-mode)

;; 14.13 interactive highlight
;;(global-highlight-changes-mode 1)
(global-hi-lock-mode 1)
(setq hi-lock-auto-select-face t)

;; 14.16 Useless Whitespace
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indicate-empty-lines t)

;; 14.18 optional mode line features
(size-indication-mode 1)

(global-linum-mode t)

(column-number-mode t)

(setq display-time-24hr-format t)
(display-time-mode 1)

(setq display-time-format "%m/%d %R %u")

(display-battery-mode t)

;; 14.20 Curssor Display
(global-hl-line-mode t)
(setq-default cursor-type 'bar)
;; Set any color as the background face of the current line:
(set-face-background 'hl-line "#3e4446")
;; To keep syntax highlighting in the current line:
(set-face-foreground 'highlight nil)

;; 14.22 Visual Line mode
(global-visual-line-mode t)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
;; 14.23 customization of display

;; 20.7 Convenience Features for Window Handling
(winner-mode 1)

;; 21.8 Fonts
(require 'cl)
(defun font-candidate (&rest fonts)
  "Return existing font which first match."
  (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(let ((en-font (font-candidate "DejaVu Sans Mono-14" "Consolas-14"))
      (zh-font (font-candidate "Microsoft Yahei-14" "文泉驿微米黑 14")))
  ;;set en-font
  (setq default-frame-alist (list (cons 'font en-font)))
  ;; set zh-font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font "fontset-default" charset zh-font)))

;;(setq window-system-default-frame-alist '() )

;;trasparent transparency of emacs
;; (defun transparency (value)
;;   "Sets the transparency of the frame window. 0=transparent/100=opaque"
;;   (interactive "Transparency Value 0 - 100 opaque:")
;;   (set-frame-parameter (selected-frame) 'alpha value))
;; (transparency 100)

;; 21.12 Scroll Bars
(set-scroll-bar-mode nil)
;; 21.13 Drag and  Drop
;; 21.14 Menu Bars
;; (menu-bar-mode nil)
;; 21.15 Toolbar
(tool-bar-mode nil)

;; 21.16 Dialog Boxes
;; 21.17 Tooltips
;; 21.18 Mouse Avoidance
(mouse-avoidance-mode 'animate)
;; 21.19 Non-Window Terminals
;; 21.20 Text-Only Mouse

;; 24.3 Tabs vs Spaces
;; (setq-default indent-tabs-mode t)

;; (setq-default tab-width 4)
;; (setq-default tab-stop-list (number-sequelnce 4 120 4))
;; 24.4 Convenience Features for Indentation
;; (setq tab-always-indent nil)
(electric-indent-mode t)
;; 25.2 sentences
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 25.5 Filling Text
;; (add-hook 'org-mode-hook 'turn-on-auto-fill)
;; (setq-default auto-fill-function 'do-auto-fill)
;; 25.9 Org mode

;; 25.10 TeX Mode
;; 25.10.3 TeX Printing Command
;; (setq latex-run-command "xelatex")

;; 26.1 major mode for programming languages
;; 26.2.4 Which Function Mode
(which-function-mode 1)
;; 26.4 Commands for Editing with Parentheses
;; 26.4.3 matching parentheses
(show-paren-mode t)
(setq show-paren-style 'expression)

(electric-pair-mode t)
(setq electric-pair-preserve-balance t)
(setq electric-pair-delete-adjacent-pairs t)
(setq electric-pair-open-newline-between-pairs t)
(setq electric-pair-skip-whitespace t)

;; (defvar markdown-electric-pairs '((?* . ?*)) "Electric pairs for markdown-mode")
;; (defun markdown-add-electric-pairs ()
;;   (setq-local electric-pair-pairs (append electric-pair-pairs markdown-electric-pairs)))
;; (add-hook 'markdown-mode-hook 'markdown-add-electric-pairs)


;; 26.5.2 Multiple Lines of Comments
;; comment-dwim-line-version-1
;; (defun comment-dwim-line()
;;   (interactive)
;;   (let ((start (line-beginning-position))
;; 	(end (line-end-position)))
;;     (when (region-active-p)
;;       (setq start (save-excursion
;; 		    (goto-char (region-beginning))
;; 		    (beginning-of-line)
;; 		    (point))
;; 	    end (save-excursion
;; 		  (goto-char (region-end))
;; 		  (end-of-line)
;; 		  (point))))
;;     (comment-or-uncomment-region start end)))

;; (global-set-key (kbd "C-;") 'comment-dwim-line)

;; 26.6.3 Emacs Lisp Documentation Lookup
(add-hook 'emacs-lisp-mode-hook (lambda () (eldoc-mode t)))

;; 26.7 Hideshow minor mode
(add-hook 'prog-mode-hook 'hs-minor-mode)
;; 26.8 Completion for symbol names

;; 26.9 MixedCase Words
(global-subword-mode 1)
;; 26.11 Other Features Useful for Editing Programs
;; (add-to-list 'electric-layout-rules '(?{ . around))
(electric-layout-mode t)
;; (global-prettify-symbols-mode t)
;; 27.5 Finding Syntax Error on The Fly

;;29.5 Frame Title
(setq frame-title-format '("%*" " " "%f"))


;; (defun load-directory (dir)
;;   (let ((load-it (lambda (f) (load-file (concat (file-name-as-directory dir) f)))))
;;     (mapc load-it (directory-files dir nil "\\.el$"))))

;; load emacs builtin feature
;; (load-directory "~/.emacs.d/lisps/")



;;42 saving emacs sessions
(desktop-save-mode 1)

;; 48.1.4 Saving Customizations
(setq custom-file "~/.emacs.d/emacs-custom.el")

;; 48.1.7 custom themes
(setq custom-enabled-themes '(sanityinc-tomorrow-eighties))

;; 50.2 Package Installation
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(
			 ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("Marmalade" ."http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
			 ("Org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
			 ))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))



;;; 开始设置第三方插件包
(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1)
  ;; (setq company-global-modes t)
  (global-company-mode)

  (defun company-c/c++-mode-setup ()
    (set (make-local-variable 'company-backends)
	 (add-to-list 'company-backends '(
					  company-yasnippet
					  ;; company-keywords
					  ;; company-dabbrev
					  ;; company-semantic
					  ;; company-clang
					  ;; company-gtags
					  ))))

  (add-hook 'c-mode-hook 'company-c/c++-mode-setup)
  (add-hook 'c++-mode-hook 'company-c/c++-mode-setup)

  (defun company-cmake-mode-setup()
    (set (make-local-variable 'company-backends)
	 (add-to-list 'company-backends '(
					  company-yasnippet
					  company-cmake))))
  (add-hook 'cmake-mode 'company-cmake-mode-setup)

  ;; (defun company-elisp-mode-setup ()
  ;;   (set (make-local-variable 'company-backends)
  ;; 	 (list (append company-common-backends '(
  ;; 					 company-elisp
  ;; 					 )))))
  ;; (add-hook 'emacs-lisp-mode-hook 'company-elisp-mode-setup)
  )


;; (use-package helm
;;   :ensure t
;;   :bind-keymap ("C-c h" . helm-command-map)
;;   :bind (
;; 		 ("M-x"     . helm-M-x)
;;          ("C-x C-b" . helm-buffer-list)
;;          ("C-x C-f" . helm-find-files)
;; 		 )
;;   :config
;;   (require 'helm-config)

;;   ;; enable modes
;;   (helm-mode 1)
;;   (helm-adaptive-mode 1)
;;   (helm-projectile-on)
;;   ;; enable fuzzy matching globally in all functions helmized by helm-mode
;;   (setq helm-mode-fuzzy-match t)
;;   (setq helm-completion-in-region-fuzzy-match t)

;;   (helm-autoresize-mode 1)

;;   (setq helm-candidate-number-limit 100)

;;   ;; use locate by regex
;;   (when (equal system-type 'gnu/linux)
;; 	(setq helm-locate-command "locate %s -e -A --regex %s"))
;;   ;; helm-locate 使用 es.exe 的时候 everything 必须要启动
;;   (when (equal system-type 'windows-nt)
;; 	(let ((str (shell-command-to-string "tasklist /FI \"IMAGENAME eq Everything.exe\"")))
;; 	  (when (not (string-match "Everything.exe" str))
;; 		(when (executable-find "everything")
;; 		  ;; (shell-command "taskkill /IM everything.exe")
;; 		  (start-process "everything" nil "everything" "-admin" "-minimized")))))

;;   (when (executable-find "curl")
;; 	(setq helm-google-suggest-use-curl-p t))

;;   (when (executable-find "ack-grep")
;; 	(setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
;; 		  helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

;;   (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
;; 		helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
;; 		helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
;; 		helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
;; 		helm-ff-file-name-history-use-recentf t)
;;   (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

;;   (setq helm-apropos-function-list t)

;;   (require 'helm-eshell)

;;   (add-hook 'eshell-mode-hook
;; 			#'(lambda ()
;; 				(define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))
;;   )


;; (use-package helm-projectile
;;   :ensure t
;;   :config
;;   (helm-projectile-on)
;;   )

(use-package magit
  :ensure t
  :bind ([f8] . magit-status)
  :config
  (require 'find-func)
  (info-initialize)
  (add-to-list 'Info-directory-list (file-name-directory (find-library-name "magit"))))

;; (use-package perspective
;;   :ensure t)

;; (use-package projectile
;;   :ensure t
;;   :config
;;   (projectile-global-mode)

;;   ;; indexing and caching
;;   (when (equal system-type 'windows-nt)
;; 	(setq projectile-indexing-method 'alien)
;; 	(setq projectile-enable-caching t))

;;   ;; switching projects
;;   (setq projectile-switch-project-action 'helm-projectile)

;;   ;; completion
;;   (setq projectile-completion-system 'helm)

;;   )


(use-package restart-emacs
  :ensure t
  :config
  )


(use-package yasnippet
  :ensure t
  ;; :bind (
  ;; 		 :map yas-minor-mode-map
  ;; 		 	  ;; Remove Yasnippet's default tab key binding
  ;; 		 	  ("TAB" . nil)
  ;; 		 	  ("<tab>" . nil)
  ;; 		 	  ;; Set Yasnippet's key binding to shift+tab
  ;; 		 	  ("<backtab>" . yas-expand)
  ;; 		 )
  :config
  (yas-global-mode 1)
  )

;; load third party packages
;; (load-directory "~/.emacs.d/load.d")


;; GNU Emacs Lisp reference manual.
;; An Introduction to Programming in Emacs Lisp.
;; GNU Emacs FAQ.
;; GNU Emacs on MS Windows FAQ.
;; GNU Emacs reference cards.
;; Ada-mode(Emacs mode for editing Ada code.)
;; Auth-source Emacs library for storing and sharing secret data.
;; 在 window 下莫名卡顿，先注释
;; (require 'auth-source)
;; (add-to-list 'auth-sources "~/.emacs.d/.authinfo.gpg")
;; start pageant first
;; (when (equal system-type 'windows-nt)
;;   (let ((str (shell-command-to-string "tasklist /FI \"IMAGENAME eq pageant.exe\"")))
;; 	(when (not (string-match "pageant.exe" str))
;; 	  (when (executable-find "pageant")
;; 		;;  (shell-command-to-string "taskkill /IM pageant.exe")
;; 		(start-process "pageant" nil "pageant")))))

;; Autotype	Features for frequently-entered text.
;; Calc	Calc is an advanced calculator and mathematical tool.

;; CC mode Mode for editing C, C++, Objective C, Java, Pike, and IDL code.
;; CL	GNU Emacs Common Lisp support.
;; D-Bus	Emacs API for using the D-Bus message bus system.
;; Dired-X	Extra Dired features.
;; Ebrowse	C++ class browser.
;; EDE	Package to simplify building and debugging programs.
;;  (require 'init-cedet)
;; EDT	EDT Emulator.
;; Ediff	Visual interface for comparing and merging programs.
;; EIEIO	Common Lisp Object System library for Emacs.
;; Emacs GnuTLS	Emacs interface to the GnuTLS library.
;; Emacs MIME	Emacs library for composing and showing MIME messages.
;; EasyPG Assistant	Emacs user interface to the GNU Privacy Guard.
;; ERC	Modular and extensible IRC client for Emacs.
;; ERT	The Emacs Lisp Regression Testing tool.
;; Eshell	Command shell implemented in Emacs Lisp.
;; EUDC	The Emacs Unified Directory Client.
;; EWW	A web browser.
;; Forms	Mode for manipulating text forms.
;; Flymake	On-the-fly programming language syntax checker.
;; Gnus	Mail and news reader.
;; Htmlfontify	Export buffers to HTML.
;; IDLWAVE	Major mode and shell for IDL and WAVE/CL files.
;; IDO	A package for interactively doing things.
;; Info	The Info documentation browser.
;; Mairix	Emacs interface to the Mairix email indexing tool.
;; Message	Mail and news composition mode for Gnus.
;; MH-E	Interface to the MH mail system.
;; Newsticker	A newsticker for Emacs.
;; nXML	XML editing mode with RELAX NG support.
;; Octave mode	Major mode for GNU Octave code.
;; Org mode	Outline-based note manager and organizer.
;; PCL-CVS	Front-end to CVS.
;; PGG	Obsolete interface library for secure communication; see EasyPG.
;; RCIRC	IRC client for Emacs.
;; RefTeX	Manage labels, references, citations and index entries.
;; Remember	Tool for managing todo lists, schedules, and other data.
;; SASL	Emacs interface to the SASL (Simple Authentication and Security Layer) framework.
;; Semantic	Source code parsing utilities for Emacs.
;; Semantic parser (bovine)	The original Semantic parser.
;; Semantic Recoder	Converts information from Semantic back into code.
;; SES	The Simple Emacs Spreadsheet.
;; Sieve	Mode for the Sieve mail filtering language.
;; SMTP	Emacs library for sending mail via SMTP.
;; Speedbar	File and tag summarizing utility.
;; Supercite	Package for citing and attributing messages.
;; Todo mode	Keeping track of things to do.
;; URL	Library for manipulating and retrieving URLs and URIs.
;; 5 General Facilities
;; 5.2 Proxies and Gatewaying
;; (setq url-proxy-services
;; 	  '(
;; 		("http" . "127.0.0.1:10086")
;; 		("https" . "127.0.0.1:10086")
;; 		))

;; Vip	An older VI emulator.
;; Viper	VI emulator.
;; Widget	Library for graphical widgets.
;; Wisent	An Emacs implementation of the GNU Compiler Compiler Bison.
;; Woman	Browsing UN*X pages without man.
(put 'upcase-region 'disabled nil)
