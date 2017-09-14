;; package -- Summary
;; -*- coding:utf-8; -*-
;;; Commentary:

;;; code:
;; (toggle-debug-on-error)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;自定义函数
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun get-package-install-path(package-name)
  "获取包的安装路径"
  (seq-find (lambda (x) (string-match package-name x)) load-path))

(defun load-directory (dir)
  "将目录中的所有文件载入"
  (let ((load-it (lambda (f) (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))

;; (load-directory "~/.emacs.d/lisps/")	;load emacs builtin feature
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;内建配置
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (toggle-debug-on-error)

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
;; (menu-bar-mode -1)
;; 21.15 Toolbar
(if window-system
    (tool-bar-mode -1)
  )

;; 21.16 Dialog Boxes
;; 21.17 Tooltips
;; 21.18 Mouse Avoidance
(mouse-avoidance-mode 'animate)
;; 21.19 Non-Window Terminals
;; 21.20 Text-Only Mouse

;; 24.3 Tabs vs Spaces
(setq-default indent-tabs-mode 'complete)
(setq-default tab-width 4)
;; (setq-default tab-stop-list (number-sequelnce 4 120 4))
;; 24.4 Convenience Features for Indentation
(setq tab-always-indent 'complete)
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


;; 27.1 Running Compilations under Emacs
(setq compilation-scroll-output 'first-error)
;; 27.5 Finding Syntax Error on The Fly

;;29.5 Frame Title
(setq frame-title-format '("%*" " " "%f"))

;;42 saving emacs sessions
(desktop-save-mode 1)

;; 48.1.4 Saving Customizations
(setq custom-file "~/.emacs.d/emacs-custom.el")

;; 48.1.7 custom themes
;; (setq custom-enabled-themes '(sanityinc-tomorrow-eighties))

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


;; 以下内容在 emacs manual 中没有找到
;; (global-superword-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;		               第三方插件包
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(use-package auctex
  :ensure t
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :config
  ;; 1.3 Quick Start
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq TeX-PDF-mode t)
  (setq TeX-view-program-selection '((output-pdf "Okular")))

  ;; 2.5 Entering Mathematics
  ;; (add-hook 'LaTeX-mode-hook 'LaTex-math-mode)
  ;; 2.6 Completion

  ;; 2.10 Filling
  ;; (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
  ;; 3.2 Folding

  ;; 4.1.2
  (add-hook'LaTeX-mode-hook '(lambda () (setq TeX-engine 'xelatex)))
  (add-hook'LaTeX-mode-hook (lambda()
							  (add-to-list'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
							  (setq TeX-command-default "XeLaTeX")
							  (setq TeX-save-query  nil )
							  (setq TeX-show-compilation nil)
							  (flyspell-mode t)
							  ))


  (setq tex-compile-commands '(("xelatex %r")))
  (setq tex-command "xelatex")
  ;; (setq LaTeX-math-menu-unicode t)

  ;; 4.6
  (setq TeX-clean-confirm nil)

  ;; 5.2 Multifile Documents
  (setq Tex-save-query nil)
  ;; 5.3  Automatic Parsing of TeX Files
  )


(use-package auto-highlight-symbol
  :ensure t
  :config
  (global-auto-highlight-symbol-mode t)
  )


(use-package cc-mode
  :ensure t
  :config
  ;; (c-set-offset 'substatement-open 0)
  ;; (setq c-basic-offset 8)
  (setq c-default-style '((java-mode . "java")
						  (awk-mode . "awk")
						  (other . "linux")))
  )


(use-package cdlatex
  :ensure t)


(use-package clang-format
  :ensure t
  :bind (("C-c i" . clang-format-region)
		 ("C-c b" . clang-format-buffer))

  :config
  (setq clang-format-style "google")
  )


(use-package cmake-mode
  :mode
  ("CMakeLists\\.txt\\'" . cmake-mode)
  ("\\.cmake\\'" . cmake-mode)
  :ensure t
  :config
  )


(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-show-numbers t)
  (global-company-mode)

  (defvar company-common-backends)

  ;; (setq company-common-backends '(company-capf company-dabbrev company-files))
  (setq company-common-backends '(company-files))
  ;; (setq company-common-backends '(company-capf company-files :separate))
  (if (package-installed-p 'yasnippet)
      (add-to-list 'company-common-backends 'company-yasnippet))
  (if (package-installed-p 'helm-gtags)
      (add-to-list 'company-common-backends 'company-gtags))

  (defun company-c/c++-mode-setup ()
    (let ((special-backends company-common-backends))
      (if (package-installed-p 'company-irony)
		  (add-to-list 'special-backends 'company-irony))
      (if (package-installed-p 'company-irony-c-headers)
		  (add-to-list 'special-backends 'company-irony-c-headers))
      (set (make-local-variable 'company-backends) (list special-backends))))

  (add-hook 'c-mode-hook 'company-c/c++-mode-setup)
  (add-hook 'c++-mode-hook 'company-c/c++-mode-setup)

  (defun company-cmake-mode-setup()
    (let ((special-backends company-common-backends))
      (if (package-install-p 'company-cmake)
		  (add-to-list 'special-backends 'company-cmake))
      (set (make-local-variable 'company-backends) (list special-backends))))
  (add-hook 'cmake-mode 'company-cmake-mode-setup)

  (defun company-elisp-mode-setup ()
    (let ((special-backends company-common-backends))
      (add-to-list 'special-backends 'company-elisp)
      (set (make-local-variable 'company-backends) (list special-backends))))
  (add-hook 'emacs-lisp-mode-hook 'company-elisp-mode-setup)

  (defun company-lua-mode-setup ()
    (let ((special-backends company-common-backends))
      (if (package-installed-p 'company-lua)
		  (add-to-list 'special-backends 'company-lua))
      (set (make-local-variable 'company-backends) (list special-backends))))
  (add-hook 'lua-mode-hook 'company-lua-mode-setup)

  (defun company-python-mode-hook ()
    (let ((special-backends '()))
      (if (package-installed-p 'company-jedi)
		  (add-to-list 'special-backends 'company-jedi))

      (set (make-local-variable 'company-backends) (list special-backends))))
  (add-hook 'python-mode-hook 'company-python-mode-hook)

  (defun company-restclient-mode-setup()
    (let ((special-backends company-common-backends))
      (if (package-installed-p 'company-restclient)
		  (add-to-list 'special-backends 'company-restclient))
      (set (make-local-variable 'company-backends) (list special-backends))))
  (add-hook 'restclient-mode-hook 'company-restclient-mode-setup)

  (defun company-go-mode-setup ()
  	(let ((special-backends company-common-backends))
	  (if (package-installed-p 'company-go)
		  (add-to-list 'special-backends 'company-go))
      (set (make-local-variable 'company-backends) (list special-backends))))
  (add-hook 'go-mode-hook 'company-go-mode-setup)
  )


(use-package company-go
  :ensure t
  :config
  )


(use-package company-irony
  :if (and (package-installed-p 'company) (package-installed-p 'irony))
  :ensure t
  :config
  )

(use-package company-irony-c-headers
  :if (and (package-installed-p 'company) (package-installed-p 'irony))
  :ensure t
  :config)

(use-package company-jedi
  :if (and (package-installed-p 'company))
  :ensure t
  :config
  (setq jedi:complete-on-dot t)
  )

(use-package company-lua
  :if (and (package-installed-p 'company) (package-installed-p 'lua-mode))
  :ensure t
  :config
  )


(use-package company-quickhelp
  :if (package-installed-p 'company)
  :ensure t
  :config
  (setq company-quickhelp-delay 2)
  (company-quickhelp-mode 1)
  )


(use-package company-restclient
  :if (and (package-installed-p 'company) (package-installed-p 'restclient))
  :ensure t)


(use-package crontab-mode
  :ensure t
  :mode
  ("\\.cron\\(tab\\)?\\'" . crontab-mode)
  ("cron\\(tab\\)?\\."    . crontab-mode)
  :config
  )


(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'"
  :config)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  :config
  ;; (setq flycheck-clang-include-path '("/usr/local/include/"))
  (setq flycheck-json-python-json-executable "python3")
  )


(use-package flycheck-irony
  :ensure t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
)

(defun my-go-mode-hook ()
  ;; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ;(auto-highlight-symbol-mode) ;不知道为什么global-auto-highlight-mode在go-mode中关闭了
  (go-guru-hl-identifier-mode)
  )


(use-package go-dlv
  :ensure t
  :config

  )

(use-package go-eldoc
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  )


(use-package go-guru
  :ensure t
  :config)


(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook 'go-mode-hook 'my-go-mode-hook)
  )


(use-package guide-key
  :ensure t
  :config
  (setq guide-key/guide-key-sequence t)

  (setq guide-key/highlight-command-regexp
		'("rectangle"
		  ("register" . font-lock-type-face)
		  ("bookmark" . "hot pink")))

  (setq guide-key/idle-delay 0.5)

  (setq guide-key/recursive-key-sequence-flag t)

  (setq guide-key/popup-window-position 'bottom)

  (guide-key-mode 1)
  )


(use-package header2
  :ensure t
  )
;; (defvar helm-command-prefix-key)
;; (setq helm-command-prefix-key nil)

;; (use-package helm-config
;;   :demand
;;   :bind-keymap ("C-c h" . helm-command-map)
;;   )


(use-package helm
  :diminish helm-mode
  :ensure t
  :init
  (require 'helm-config)
  :bind-keymap ("C-c h" . helm-command-map);
  :bind
  (
   ("C-x b" . helm-buffers-list)
   ;; ("M-y" . helm-show-kill-ring)
   ("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   )
  :config
  ;; enable modes
  (helm-mode 1)
  (helm-adaptive-mode 1)
  ;; enable fuzzy matching globally in all functions helmized by helm-mode
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)
  (helm-autoresize-mode 1)
  (setq helm-candidate-number-limit 100)

  ;; use locate by regex
  (when (equal system-type 'gnu/linux)
    (setq helm-locate-command "locate %s -e -A --regex %s"))
  ;; helm-locate 使用 es.exe 的时候 everything 必须要启动
  (when (equal system-type 'windows-nt)
    (let ((str (shell-command-to-string "tasklist /FI \"IMAGENAME eq Everything.exe\"")))
      (when (not (string-match "Everything.exe" str))
		(when (executable-find "everything")
		  ;; (shell-command "taskkill /IM everything.exe")
		  (start-process "everything" nil "everything" "-admin" "-minimized")))))

  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (when (executable-find "ack-grep")
    (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
		  helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

  (setq helm-split-window-in-side-p t) ; open helm buffer inside current window, not occupy whole other window
  (setq helm-move-to-line-cycle-in-source t) ; move to end or beginning of source when reaching top or bottom of source.
  (setq helm-ff-search-library-in-sexp t) ; search for library in `require' and `declare-function' sexp.
  (setq helm-scroll-amount 8) ; scroll 8 lines other window using M-<next>/M-<prior>
  (setq helm-ff-file-name-history-use-recentf t)

  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

  (setq helm-apropos-function-list t)

  (add-hook 'eshell-mode-hook
			(lambda ()
			  (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history))))


(use-package helm-ag
  :if (package-installed-p 'helm)
  :ensure t
  :config
  )


(use-package helm-descbinds
  :if (package-installed-p 'helm)
  :ensure t
  :config
  (helm-descbinds-mode))


(use-package helm-gtags
  :if (package-installed-p 'helm)
  :ensure t
  :init
  (add-hook 'prog-mode-hook 'helm-gtags-mode)
  (custom-set-variables
   '(helm-gtags-prefix-key "\C-c g")
   ;; '(helm-gtags-suggested-key-mapping t)
   )
  :bind (:map helm-gtags-mode-map
			  ("C-c g a" . helm-gtags-tags-in-this-function)
			  ("C-c g b" . helm-gtags-display-browser)
			  ("C-c g c" . helm-gtags-clear-cache)
			  ("C-c g d" . helm-gtags-clear-all-cache)
			  ("C-c g f" . helm-gtags-find-files)
			  ("C-c g g" . helm-gtags-create-tags)
			  ("C-c g u" . helm-gtags-update-tags)
			  ("C-c g j" . helm-gtags-select)
			  ("C-c g p" . helm-gtags-pop-stack)
			  ("C-c g q" . helm-gtags-clear-stack)
			  ("C-c g Q" . helm-gtags-clear-all-stacks)
			  ("C-c g s" . helm-gtags-find-symbol)
			  ("C-c g r" . helm-gtags-find-rtag)
			  ("C-c g t" . helm-gtags-find-tag)
			  ("C-c g ," . helm-gtags-find-tag-from-here)
			  ("C-c g T" . helm-gtags-find-tag-other-window)
			  ("C-c g R" . helm-gtags-resume)
			  ("C-c g P" . helm-gtags-parse-file)
			  ("C-c g S" . helm-gtags-find-pattern)
			  ("C-c g ." . helm-gtags-dwim)
			  ("C-c g <" . helm-gtags-previous-history)
			  ("C-c g >" . helm-gtags-next-history)
			  )
  :config
  (custom-set-variables
   '(helm-gtags-auto-update t)
   '(helm-gtags-cache-select-result nil)
   '(helm-gtags-direct-helm-completing t)
   '(helm-gtags-display-style 'detail)
   '(helm-gtags-fuzzy-match nil)
   '(helm-gtags-highlight-candidate t)
   ;; '(helm-gtags-ignore-case t)
   '(helm-gtags-parse-file 'root)
   '(helm-gtags-path-style 'root)
   '(helm-gtags-pulse-at-cursor t)
   '(helm-gtags-read-only nil)
   '(helm-gtags-update-interval-second 30)
   '(helm-gtags-use-input-at-cursor t)
   )
  )


(use-package helm-projectile
  :if (and (package-installed-p 'helm) (package-installed-p 'projectile))
  :ensure t
  :config
  (helm-projectile-on)
  )


(use-package irony
  :ensure t
  :init
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  ;; (add-hook 'objc-mode-hook 'irony-mode)
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  ;; (defun my-irony-mode-hook ()
  ;;   (define-key irony-mode-map [remap completion-at-point]
  ;;     'irony-completion-at-point-async)
  ;;   (define-key irony-mode-map [remap complete-symbol]
  ;;     'irony-completion-at-point-async))

  ;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)

  )


(use-package irony-eldoc
  :if (package-installed-p 'irony)
  :ensure t
  :init
  (add-hook 'irony-mode-hook 'irony-eldoc)
  :config
  )


(use-package json-mode
  :ensure t
  :mode "\\.json$"
  :config)


(use-package lua-mode
  :ensure t
  :mode "\\.lua$"
  :interpreter "lua"
  :config
  (setq lua-indent-level 4)
  (setq lua-indent-string-contents t)
  )


(use-package magit
  :ensure t
  :bind ([f8] . magit-status)
  :config
  (require 'find-func)
  (info-initialize)
  (add-to-list 'Info-directory-list (file-name-directory (find-library-name "magit"))))


(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :init
  (setq markdown-command "multimarkdown"))


(use-package markdown-preview-mode
  :ensure t
  :config)


(use-package multiple-cursors
  :ensure t
  :bind
  (("C-c m t" . mc/mark-all-like-this)
   ("C-c m m" . mc/mark-all-like-this-dwim)
   ("C-c m l" . mc/edit-lines)
   ("C-c m e" . mc/edit-ends-of-lines)
   ("C-c m a" . mc/edit-beginnings-of-lines)
   ("C-c m n" . mc/mark-next-like-this)
   ("C-c m p" . mc/mark-previous-like-this)
   ("C-c m s" . mc/mark-sgml-tag-pair)
   ("C-c m d" . mc/mark-all-like-this-in-defun))
  :config
  )


(use-package moe-theme
  :ensure t
  :config
  ;; (load-theme 'moe-dark)
  ;; (add-to-list 'custom-theme-load-path (get-package-install-path "moe-theme"))
  (setq moe-theme-highlight-buffer-id t)

  (if (package-installed-p 'markdown-mode)
      (setq moe-theme-resize-markdown-title '(1.5 1.4 1.3 1.2 1.0 1.0)))

  (if (package-installed-p 'org)
      (setq moe-theme-resize-org-title '(1.5 1.4 1.3 1.2 1.1 1.0 1.0 1.0 1.0)))

  ;; (setq moe-theme-resize-rst-title '(1.5 1.4 1.3 1.2 1.1 1.0))
  ;; (if (package-installed-p 'powerline)
  ;;     (powerline-moe-theme))

  (moe-dark)
  )


(use-package nginx-mode
  :ensure t)

(use-package org
  :ensure t
  ;; :bind (
  ;; 	 ("C-c '" . org-src-mode)
  ;; 	 ("C-c l" . org-store-link)
  ;; 	 ("C-c a" . org-agenda)
  ;; 	 ("C-c b" . org-iswitchb)
  ;; 	 )
  :init
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)

  :config

  ;; 3 Tables
  (setq org-ascii-table-keep-all-vertical-lines t)
  ;; 3.2 Column width and alignment
  (setq org-startup-align-all-tables t)
  ;; 4.4 Handling links
  (setq org-file-apps '((auto-mode . emacs)
						("\\.mm\\'" . default)
						("\\.x?html?\\'" . default)
						("\\.pdf\\'" . "okular %s")
						))

  ;; Markup for rich export
  ;; 11.7 Embedded LaTeX
  ;; 11.7.2 Subscripts and superscripts（上标和下标）
  ;; (setq org-use-sub-superscripts '{})
  (setq org-export-with-sub-superscripts '{})
  ;; 12 Exporting
  ;; 12.3 Export setting
  (setq org-export-with-section-numbers 3)
  ;; 12.6 HTML export
  ;; 12.6.2 HTML doctypes
  ;; (setq org-html-doctype "html4-transitional")
  ;; 12.6.6 Tables
  (setq org-html-table-default-attributes '(:border "1" :cellspacing "0" :cellpadding "6" :rules "groups" :frame "hsides" :width "auto"))

  ;; 12.6.12 JavaScript supported display of web pages
  ;; (setq org-html-infojs-options '((path . "../scripts/org-info.js")
  ;; 								(view . "showall")
  ;; 								(toc . :with-toc)
  ;; 								(ftoc . "0")
  ;; 								(tdepth . "max")
  ;; 								(sdepth . "max")
  ;; 								(mouse . "underline")
  ;; 								(buttons . "0")
  ;; 								(ltoc . "1")
  ;; 								(up . :html-link-up)
  ;; 								(home . :html-link-home)))

  ;; 12.7 LaTeX and PDF export
  (require 'ox-latex)
  (add-hook'org-mode-hook
   (lambda ()
     (setq org-latex-default-packages-alist
		   (delete'("AUTO" "inputenc" t) org-latex-default-packages-alist))))

  (add-to-list 'org-latex-packages-alist '("" "xeCJK" t))
  (add-to-list 'org-latex-packages-alist '("" "listings" t))
  (add-to-list 'org-latex-packages-alist '("" "color" t))
  ;; 12.7.2 LaTeX specific export settings
  (setq org-latex-pdf-process
		'("xelatex -interaction nonstopmode -output-directory %o %f"
		  "xelatex -interaction nonstopmode -output-directory %o %f"
		  "xelatex -interaction nonstopmode -output-directory %o %f"))

  ;; 12.7.3 Header and sectioning structure
  ;; 设置 article header
  (setcar (cdr (assoc "article" org-latex-classes))
		  "\\documentclass[12pt,a4paper]{article} \\usepackage[margin=2cm]{geometry} \\usepackage{fontspec} \\usepackage[slantfont,boldfont,CJKnumber,CJKtextspaces]{xeCJK} \\setCJKmainfont{AR PL UKai CN} \\setmainfont{DejaVu Serif} \\setmonofont{DejaVu Sans Mono} \\setsansfont{DejaVu Sans} \\usepackage[colorlinks,linkcolor=blue,anchorcolor=red,citecolor=green,urlcolor=blue]{hyperref}")
  (when (equal system-type 'windows-nt)
    (setcar (cdr (assoc "article" org-latex-classes))
			"\\documentclass[12pt,a4paper]{ctexart}"))

  ;; 13 Publishing
  (require 'ox-publish)
  ;; 13.1 Configuration
  ;; 13.1.1 The variable org-publish-project-alist
  (setq org-publish-project-alist
		'(
		  ("org"
		   ;; 13.1.2 Sources and destinations for files
		   :base-directory "~/gitlab/org-notes/org/" ;设置存放.org 文件位置
		   :publishing-directory "~/github/phenix3443.github.io/" ;导出 html 文件位置
		   ;; :preparation-function
		   ;; :completion-function

		   ;; 13.1.3 Selecting files
		   :base-extension "org"			;仅处理.org 格式文件
		   :exclude "*~"
		   ;; :include
		   :recursive t

		   ;; 13.1.4 Publishing action
		   :publishing-function org-html-publish-to-html
		   :htmlized-source t

		   ;; 13.1.5 Options for the exporters
		   :headline-levels 4             ; Just the default for this project.
		   :with-sub-superscript nil
		   :html-extension "html"
		   :style-include-default nil
		   ;; :html-head "<script type=\"text/javascript\" src=\"./js/org-info.js\">"
		   ;; 13.1.7 Generating a sitemap
		   :auto-sitemap t
		   ;; 13.1.8 Generating an index
		   :makeindex t
		   )

		  ("static"
		   :base-directory "~/gitlab/org-notes/org/"
		   :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
		   :publishing-directory "~/github/phenix3443.github.io/"
		   :recursive t
		   :publishing-function org-publish-attachment
		   )
		  ("github" :components ("org" "static"))))
  ;; 13.4 Triggering publication
  (setq org-publish-use-timestamps-flag nil)

  (when (equal system-type 'windows-nt)
    (setq org-plist (cdr (assoc "org" org-publish-project-alist)))
    (plist-put org-plist :base-directory "D:/github/org-notes/org/")
    (plist-put org-plist :publishing-directory "D:/github/phenix3443.github.io/")

    (setq static-plist (cdr (assoc "static" org-publish-project-alist)))
    (plist-put static-plist :base-directory "D:/github/org-notes/org/")
    (plist-put static-plist :publishing-directory "D:/github/phenix3443.github.io/"))

  ;; (setq org-babel-default-header-args
  ;; (cons '(:base-directory "D:/projects/org-notes/org/")
  ;; (assq-delete-all org org-publish-project-alist)
  ;; )))

  ;; 14 Working with source code
  ;; 14.2 Editing source code
  (setq org-edit-src-auto-save-idle-delay 15)
  ;; (setq org-edit-src-turn-on-auto-save t)
  (setq org-src-window-setup 'current-window)
  (setq org-src-preserve-indentation t)
  (setq org-edit-src-content-indentation 4)
  (setq org-src-ask-before-returning-to-edit-buffer nil)
  (setq org-src-fontify-natively t)
  (defface org-block-begin-line
    '((t (:underline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
    "Face used for the line delimiting the begin of source blocks.")
  (defface org-block-background
    '((t (:background "#FFFFEA")))
    "Face used for the source block background.")
  (defface org-block-end-line
    '((t (:overline "#A7A6AA" :foreground "#008ED1" :background "#EAEAFF")))
    "Face used for the line delimiting the end of source blocks.")

  ;; 14.3 Exporting code blocks
  ;; (setq org-export-babel-evaluate 'inline)
  ;; 14.4 Extracting source code
  (add-hook 'org-babel-post-tangle-hook
			(lambda () (message "I'm in %s" (buffer-file-name)) ))
  ;; 14.7 Languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (C . t)
     (emacs-lisp . t)
     (python . t)
     (R . t)
     (sh . t)
     (makefile . t)))
  ;; 14.8 Header arguments
  ;; 14.8.1 Using header arguments
  (setq org-babel-default-header-args
		(append '((:padline . "true")(:comments . "yes")(:mkdirp . "yes"))  org-babel-default-header-args))
  ;; (setq org-babel-default-header-args
  ;; 	  (cons '(:tangle . "yes")
  ;; 			(assq-delete-all :tangle org-babel-default-header-args)))
  ;; 15 Miscellaneous
  ;; 15.4 Code evaluation and security issues
  (setq org-confirm-babel-evaluate nil)

  ;; 15.8 A cleaner outline view
  (setq org-startup-folded nil)
  ;; (setq org-startup-indented t)
  ;; (setq org-startup-with-inline-images t)
  (setq org-startup-with-latex-preview t)
  ;; (setq org-list-indent-offset 2)

  (setq org-babel-python-command "python3")
  )


(use-package paredit
  :ensure t
  :bind(
		:map paredit-mode-map
			 ("C-)" . paredit-forward-slurp-sexp)
			 ("C-(" . paredit-backward-slurp-sexp)
			 ("C-}" . paredit-forward-barf-sexp)
			 ("C-{" . paredit-backward-barf-sexp)
			 ("C-<right>" . nil)
			 ("C-<left>" .  nil)
			 )
  :init
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  :config
  ;; (require-package 'paredit-everywhere)
  ;; (add-hook 'css-mode-hook 'paredit-everywhere-mode)
  )


(use-package pangu-spacing
  :ensure t
  :config
  (setq pangu-spacing-real-insert-separtor nil)
  (global-pangu-spacing-mode 1)
  )


;; (use-package persp-mode
;;   :ensure t
;;   :config
;;   (persp-mode 1)
;;   )

(use-package powerline
  :disabled t
  :ensure t
  :config
  (powerline-default-theme)
  )


(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)

  (if (equal system-type 'windows-nt)
      (progn
		(setq projectile-indexing-method 'alien)
		(setq projectile-enable-caching t)
		))

  (if (package-installed-p 'helm-projectile)
      (progn
		;; switching projects
		(setq projectile-switch-project-action 'helm-projectile)
		;; completion
		(setq projectile-completion-system 'helm)
		))
  )


(use-package protobuf-mode
  :ensure t
  :mode ".proto$"
  :config
  )


(use-package python-mode
  :ensure t
  :disabled t
  :mode ".py$"
  :interpreter "python"
  :config
  )


(use-package restart-emacs
  :ensure t
  :config
  )


(use-package restclient
  :ensure t
  :config)


(use-package smart-comment
  :ensure t
  :bind ("M-;" . smart-comment))


(use-package smart-compile
  :ensure t
  :config
  )


(use-package smart-mode-line
  :ensure t
  :disabled t
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
  )


(use-package sql-indent
  :ensure t
  :config
  (eval-after-load "sql"
	'(load-library "sql-indent"))
  ;; (setq sql-indent-offset 4)
  (setq sql-indent-debug t)
  )


(use-package sqlup-mode
  :ensure t
  :config
  ;; Capitalize keywords in SQL mode
  (add-hook 'sql-mode-hook 'sqlup-mode)
  ;; Capitalize keywords in an interactive session (e.g. psql)
  (add-hook 'sql-interactive-mode-hook 'sqlup-mode)
  ;; Set a global keyword to use sqlup on a region
  (global-set-key (kbd "C-c u") 'sqlup-capitalize-keywords-in-region)
  )


(use-package sr-speedbar
  :ensure t
  :config
  )


(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode 1)
  )


(use-package yaml-mode
  :ensure t)


(use-package yapfify
  :ensure t
  :config
  (add-hook 'python-mode-hook 'yapf-mode))


(use-package yasnippet
  :ensure t
  ;; :bind(
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


;; (use-package zenburn-theme
;;   :ensure t
;;   :config
;;   (add-to-list 'custom-theme-load-path (get-package-install-path "zenburn-theme"))
;;   (load-theme 'zenburn t)
;;   )

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
