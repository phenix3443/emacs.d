;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package org
  :ensure t
  :config

  (global-set-key "\C-c'" 'org-src-mode)
  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key "\C-ca" 'org-agenda)
  (global-set-key "\C-cb" 'org-iswitchb)
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)

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
		   (delete'("AUTO" "inputenc" t) org-latex-default-packages-alist))
	 ))

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
		   :base-directory "~/github/org-notes/org/" ;设置存放.org 文件位置
		   :publishing-directory "~/github/org-notes/phenix3443.github.io/" ;导出 html 文件位置
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
		   :base-directory "~/github/org-notes/org/"
		   :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
		   :publishing-directory "~/github/org-notes/phenix3443.github.io/"
		   :recursive t
		   :publishing-function org-publish-attachment
		   )
		  ("github" :components ("org" "static"))))
  ;; 13.4 Triggering publication
  (setq org-publish-use-timestamps-flag t)

  (when (equal system-type 'windows-nt)
	(setq org-plist (cdr (assoc "org" org-publish-project-alist)))
	(plist-put org-plist :base-directory "D:/github/org-notes/org/")
	(plist-put org-plist :publishing-directory "D:/github/org-notes/phenix3443.github.io/")

	(setq static-plist (cdr (assoc "static" org-publish-project-alist)))
	(plist-put static-plist :base-directory "D:/github/org-notes/org/")
	(plist-put static-plist :publishing-directory "D:/github/org-notes/phenix3443.github.io/"))

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
  )
(provide 'init-org)
