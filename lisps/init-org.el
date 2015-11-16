;;; init-org.el ---
;;
;; Filename: init-org.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer: phenix3443
;; Created: 周六 三月  7 16:09:24 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 164
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;;; required by text-conf.el, from org manual(http://orgmode.org/org.html)

(require-package 'cdlatex)
(require-package 'htmlize)

(require 'cdlatex)
(require 'htmlize)
(require 'iimage)

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
                      ("\\.x?html?\\'" . "okular %s")
                      ("\\.pdf\\'" . "okular %s")
					  ))

;; 12 Exporting
;; 12.3 Export setting
(setq org-export-with-section-numbers 3)
;; 12.6 HTML export
;; 12.6.2 HTML doctypes
;; (setq org-html-doctype "html4-transitional")
;; 12.6.6 Tables
;; (setq org-html-table-default-attributes '(:border "1" :cellspacing "0" :cellpadding "6" :rules "groups" :frame "box"))
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
(add-hook'org-mode-hook
          (lambda ()
            (setq org-latex-default-packages-alist
                  (delete'("AUTO" "inputenc" t) org-latex-default-packages-alist))
            ))

(add-to-list 'org-latex-packages-alist '("" "xeCJK" t))
;; 12.7.2 LaTeX specific export settings
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))

;; 12.7.3 Header and sectioning structure
;; 设置article header
(setcar (cdr (assoc "article" org-latex-classes))
"\\documentclass[12pt,a4paper]{article} \\usepackage[margin=2cm]{geometry} \\usepackage{fontspec} \\usepackage{xeCJK} \\setCJKmainfont{AR PL UKai CN} \\setmainfont{DejaVu Serif} \\setmonofont{DejaVu Sans Mono} \\setsansfont{DejaVu Sans} \\usepackage{hyperref} \\hypersetup{
  colorlinks=true, linkcolor=[rgb]{0,0.37,0.53}, citecolor=[rgb]{0,0.47,0.68}, filecolor=[rgb]{0,0.37,0.53}, urlcolor=[rgb]{0,0.37,0.53},pagebackref=true,  linktoc=all}")

;; 13 Publishing
(require 'ox-publish)
;; 13.1 Configuration
;; 13.1.1 The variable org-publish-project-alist
(setq org-publish-project-alist
      '(
		("org"
		 ;; 13.1.2 Sources and destinations for files
		 :base-directory "~/projects/org-notes/org/" ;设置存放.org文件位置
		 :publishing-directory "~/projects/phenix3443.github.io/" ;导出html文件位置
		 ;; :preparation-function
		 ;; :completion-function

		 ;; 13.1.3 Selecting files
		 :base-extension "org"			;仅处理.org格式文件
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
		 :base-directory "~/projects/org-notes/org/"
		 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
		 :publishing-directory "~/projects/phenix3443.github.io/"
		 :recursive t
		 :publishing-function org-publish-attachment
		 )
		("github" :components ("org" "static"))))
;; 13.4 Triggering publication
(setq org-publish-use-timestamps-flag nil)

(when (equal system-type 'windows-nt)
  (setq org-plist (cdr (assoc "org" org-publish-project-alist)))
  (plist-put org-plist :base-directory "D:/projects/org-notes/org/")
  (plist-put org-plist :publishing-directory "D:/projects/phenix3443.github.io/")

  (setq static-plist (cdr (assoc "static" org-publish-project-alist)))
  (plist-put static-plist :base-directory "D:/projects/org-notes/org/")
  (plist-put static-plist :publishing-directory "D:/projects/phenix3443.github.io/"))

;; (setq org-babel-default-header-args
;; (cons '(:base-directory "D:/projects/org-notes/org/")
;; (assq-delete-all org org-publish-project-alist)
;; )))

;; 14 Working with source code
;; 14.2 Editing source code
(setq org-edit-src-auto-save-idle-delay 15)
;; (setq org-edit-src-turn-on-auto-save t)
(setq org-src-window-setup 'current-window)
(setq org-src-preserve-indentation nil)
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
(setq org-src)
;; 14.7 Languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (C . t)
   (emacs-lisp . t)
   (python . t)
   (R . t)
   (sh . t)))
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

(provide 'init-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
