;;; init-org.el ---
;;
;; Filename: init-org.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer:
;; Created: 周六 三月  7 16:09:24 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 15
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

(require 'ox-publish)
(setq blog-dir "~/projects/phennix3443.github.io/")
(when (equal system-type 'windows-nt)
  (setq blog-dir "D:/projects/phenix3443.github.io/"))
(setq org-publish-project-alist
      '(
		("org-notes"
		 :base-directory "D:/projects/phenix3443.github.io/org/"
		 :base-extension "org"
		 :publishing-directory "D:/projects/phenix3443.github.io/public_html/"
		 :recursive t
		 :publishing-function org-html-publish-to-html
		 :headline-levels 4             ; Just the default for this project.
		 :auto-preamble t
		 )
		("org-static"
		 :base-directory "D:/projects/phenix3443.github.io/org/"
		 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
		 :publishing-directory "D:/projects/phenix3443.github.io/public_html/"
		 :recursive t
		 :publishing-function org-publish-attachment
		 )
		("org" :components ("org-notes" "org-static"))
      ))
(provide 'init-org)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
