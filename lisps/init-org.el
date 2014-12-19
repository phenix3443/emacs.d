;;; Time-stamp: <2014-08-27 10:11:18 chengxu70>
;;; required by text-conf.el, from org manual(http://orgmode.org/org.html)

(require-package 'cdlatex)
(require-package 'htmlize)

;(require 'cdlatex)
(require 'htmlize)


(global-set-key "\C-c'" 'org-src-mode)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;;3 Tables
(setq org-ascii-table-keep-all-vertical-lines t)
;;3.2 Column width and alignment
(setq org-startup-align-all-tables t)

;;12 Exporting
;;12.3 Export setting
(setq org-export-with-section-numbers 3)
;;12.6 HTML export
;;12.6.2 HTML doctypes
(setq org-html-doctype "html4-transitional")
;;12.6.6 Tables
(setq org-html-table-default-attributes '(:border "1" :cellspacing "0" :cellpadding "6" :rules "groups" :frame "box"))
;;14 Working with source code
;;14.2 Editing source code
(setq org-src-lang-modes 
	  '(("asymptote" . asy)
		("c" . c)
		("c++" . c++)
		("cpp" . c++)
		("calc" . fundamental)
		("ditaa" . artist)
		("dot" . fundamental)
		("elisp" . emacs-lisp)
		("ocaml" . tuareg)
		("screen" . shell-script)
		("bash" . sh)
		("sql" . sql)
		("sqlite" . sql)
		("xml" . nxml)))
(setq org-src-window-setup 'reorganize-frame)
(setq org-src-ask-before-returning-to-edit-buffer nil)

(setq org-edit-src-block-indentation 2)
(setq org-edit-src-content-indentation 2)
(setq org-src-preserve-indentation nil)

;;15.8 A cleaner outline view
(setq org-startup-indented t)
(setq org-startup-folded nil)
(setq org-list-indent-offset 2)
(setq org-src-fontify-natively t)

(add-hook 'org-mode-hook '(lambda()
							(set-face-attribute 'org-level-1 nil :height 1.6 :bold t)
							(set-face-attribute 'org-level-2 nil :height 1.4 :bold t)
							(set-face-attribute 'org-level-3 nil :height 1.2 :bold t)))
(provide 'init-org)
