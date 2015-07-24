;;; init.el --- emacs init file
;;
;; Filename: init.el
;; Description:
;; Author: phenix3443<phenix3443@gmail.com>
;; Maintainer:
;; Created: 周四 十二月 18 16:07:09 2014 (+0800)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated: 周六 7月 25 00:37:49 2015 (+0800)
;;           By: phenix
;;     Update #:
;; URL:
;; Doc URL:
;; Keywords: init
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
;; (setq debug-on-error t)

(defconst is-gnu-os (equal system-type 'gnu) "GNU Hurd system")
(defconst is-gnu-linux-os (equal system-type 'gnu/linux) "GNU/Linux system")
(defconst is-gnu-kfreebsd-os (equal system-type 'gnu/kfreebsd) "GNU system with a FreeBSD kernel")
(defconst is-darwin-os (equal system-type 'darwin) "Darwin")
(defconst is-ms-dos-os (equal system-type 'ms-dos) "MS-DOS system")
(defconst is-windows-nt-os (equal system-type 'windows-nt) "native win32 application")
(defconst is-cygwin-os (equal system-type 'cygwin) "cygwin")

(defconst tmp-dir "~/.emacs.d/tmp-dir/")
;; some executable program in windows OS
(when (equal system-type 'windows-nt)
  (defconst win-app-dir "~/.emacs.d/win_apps/"))

;; use proxy for internet
;; (setq url-proxy-services
	  ;; '(
		;; ("http" . "127.0.0.1:10800")
		;; ("https" . "127.0.0.1:10800")))

;;加载配置文件，按照 https://www.gnu.org/software/emacs/manual/ 出现顺序

(defun load-package-init-files()
  "load most packages init files"
  (let ((default-directory "~/.emacs.d/lisps"))
	(normal-top-level-add-to-load-path '("."))
	(normal-top-level-add-subdirs-to-load-path))
  ;; GNU Emacs manual.
  (require 'misc-conf)
  (require 'packages-conf)				;47
  (require 'minibuffer-conf)			;8
  (require 'killing-conf)				;12
  (require 'display-conf)				;14
  (require 'search-replace-conf)		;15
  (require 'files-conf)					;18
  (require 'window-conf)				;20
  (require 'frames-conf)				;21
  (require 'international-conf)			;22
  (require 'indentation-conf)			;24
  (require 'text-conf)					;25
  (require 'program-conf)				;26
  (require 'compile-test-conf)			;27
  (require 'vc-conf)					;28
  (require 'customization-conf)			;48
  (require 'init-header2)

  ;; GNU Emacs Lisp reference manual.
  ;; An Introduction to Programming in Emacs Lisp.
  ;; GNU Emacs FAQ.
  ;; GNU Emacs on MS Windows FAQ.
  ;; GNU Emacs reference cards.
  ;; Ada-mode(Emacs mode for editing Ada code.)

  ;; Auth-source Emacs library for storing and sharing secret data.
  ;; 在window下莫名卡顿，先注释
  ;; (require 'auth-source)
  ;; (add-to-list 'auth-sources "~/.emacs.d/.authinfo.gpg")
  ;; should close pageant first
  (when (equal system-type 'windows-nt)
	(when(executable-find "pageant")
	  (shell-command-to-string "taskkill /IM pageant.exe")
	  (start-process-shell-command "pageant" nil "pageant")
	  ))

  ;; Autotype	Features for frequently-entered text.
  ;; Calc	Calc is an advanced calculator and mathematical tool.

  ;; CC mode Mode for editing C, C++, Objective C, Java, Pike, and IDL code.
  (setq c-default-style '((java-mode . "java")
						  (awk-mode . "awk")
						  (other . "linux")))

  ;; CL	GNU Emacs Common Lisp support.
  ;; D-Bus	Emacs API for using the D-Bus message bus system.
  ;; Dired-X	Extra Dired features.
  ;; Ebrowse	C++ class browser.
  ;; EDE	Package to simplify building and debugging programs.
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

  ;; Tramp	Transparent remote file access system.
  (require 'tramp)
  (setq tramp-default-user "phenix")
  (setq password-cache-expiry 86400)

  ;; URL	Library for manipulating and retrieving URLs and URIs.
  ;; VIP	An older VI emulator.
  ;; Viper	VI emulator.
  ;; Widget	Library for graphical widgets.
  ;; Wisent	An Emacs implementation of the GNU Compiler Compiler Bison.
  ;; Woman	Browsing UN*X pages without man.
  )
(add-hook 'after-init-hook 'load-package-init-files)
