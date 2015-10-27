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
;;     Update #: 77
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

;; 12 Exporting
;; 12.3 Export setting
(setq org-export-with-section-numbers 3)
;; 12.6 HTML export
;; 12.6.2 HTML doctypes
(setq org-html-doctype "html4-transitional")
;; 12.6.6 Tables
(setq org-html-table-default-attributes '(:border "1" :cellspacing "0" :cellpadding "6" :rules "groups" :frame "box"))

;; 14 Working with source code
;; 14.2 Editing source code
(setq org-edit-src-auto-save-idle-delay 15)
;; (setq org-edit-src-turn-on-auto-save t)
(setq org-src-window-setup 'reorganize-frame)
(setq org-src-preserve-indentation nil)
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
		(sh . t)))
;; 14.8 Header arguments
;; 14.8.1 Using header arguments
(setq org-babel-default-header-args
	  (append '((:padline . "true")(:comments . "yes")(:mkdirp . "yes"))  org-babel-default-header-args))
;; (setq org-babel-default-header-args
;; 	  (cons '(:tangle . "yes")
;; 			(assq-delete-all :tangle org-babel-default-header-args)))

;; 15.8 A cleaner outline view
(setq org-startup-folded nil)
;; (setq org-startup-indented t)
;; (setq org-startup-with-inline-images t)
(setq org-startup-with-latex-preview t)
;; (setq org-list-indent-offset 2)


;; (add-hook 'org-mode-hook '(lambda()
							;; (set-face-attribute 'org-level-1 nil :height 1.6 :bold t)
							;; (set-face-attribute 'org-level-2 nil :height 1.4 :bold t)
							;; (set-face-attribute 'org-level-3 nil :height 1.2 :bold t)))

(require 'ox-publish)
(setq blog-dir "~/projects/phennix3443.github.io/")
(when (equal system-type 'windows-nt)
  (setq blog-dir "D:/projects/phenix3443.github.io/"))
(setq org-publish-project-alist
      '(
		("org-blog-notes"
		 :base-directory "D:/projects/phenix3443.github.io/org/"
		 :base-extension "org"
		 :publishing-directory "D:/projects/phenix3443.github.io/public_html/"
		 :recursive t
		 :htmlized-source t
		 :publishing-function org-html-publish-to-html
		 :headline-levels 4             ; Just the default for this project.
		 :auto-preamble t
		 :html-extension "html"
		 :table-of-contents t ;; 导出目录
		 :body-only t ;; Only export section between <body></body>
		 )
		("org-blog-static"
		 :base-directory "D:/projects/phenix3443.github.io/org/"
		 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
		 :publishing-directory "D:/projects/phenix3443.github.io/public_html/"
		 :recursive t
		 :publishing-function org-publish-attachment
		 )
		("blog" :components ("org-blog-notes" "org-blog-static"))
      ))
(provide 'init-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
