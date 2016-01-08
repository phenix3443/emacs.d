;;; init.el --- emacs init file
;;
;; Filename: init.el
;; Description:
;; Author: phenix3443<phenix3443@gmail.com>
;; Maintainer:
;; Created: 周四 十二月 18 16:07:09 2014 (+0800)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated: 周六 10月 24 17:52:58 2015 (+0800)
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

;; 按照 https://www.gnu.org/software/emacs/manual/ 出现顺序加载配置文件
;; GNU Emacs manual
;; (setq debug-on-error t)


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(add-to-list 'load-path "~/.emacs.d/lisps/")

;; 5 Enter Emacs
;; (setq inhibit-startup-message t)

;; 6 Exiting Emacs

;; 7 Basic Editing Commands
(require 'basic-edit-conf)

;; 8 The Minibuffer

;; 12 Killing and Moving Text
;; (require 'killing-conf)

;; 14 Controlling the Display
(require 'display-conf)
;; 15 Searching and Replacement
;; (require 'search-replace-conf)

;; 18 File Handling
;; (require 'file-conf)

;; 20 Multiple Windows
(require 'window-mgr-conf)
;; 21 Frames and Graphical Displays
(require 'frames-conf)
;; 22 international character set support
(require 'international-character-conf)

;; 24 Indentation
(require 'indentation-conf)
;; 25 Commands for Human Languages
(require 'text-conf)
;; 26 Editing Programs
(require 'program-conf)
;; 27 Compiling and Testing Programs
;; (require 'compile-test-conf)
;; 28 Maintaining Large Programs
;; 38 Using Emacs as a Server
;; (require'server)
;; (unless (server-running-p)
;;   (server-start))

;; (require 'maintain-program-project)
;; 43 Saving Emacs Sessions
;; (desktop-save-mode 1)

;; 47 Emacs Lisp Packages
(require 'packages-conf)

;; 48 Customization
;; (require 'customization-conf)


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
;; 3 Getting Started
(setq-default c-basic-offset 4)
(setq c-default-style '((java-mode . "java")
						(awk-mode . "awk")
						(other . "linux")))

;; CL	GNU Emacs Common Lisp support.
;; D-Bus	Emacs API for using the D-Bus message bus system.
;; Dired-X	Extra Dired features.
;; Ebrowse	C++ class browser.
;; EDE	Package to simplify building and debugging programs.
(require 'init-cedet)
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
;; (require 'tramp)

;; (cond
;;  ((eq system-type 'windows-nt)
;;   (setq tramp-default-method "pscp"))
;;  ((eq system-type 'gnu/linux)
;;   (setq tramp-default-method "ssh")))

;; (setq password-cache-expiry 86400)

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
