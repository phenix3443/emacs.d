;;; package -- emacs 配置文件
;;; Commentary:
;; -*- coding:utf-8; -*-

;;; code:

(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(
                         ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("Marmalade" ."http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
                         ("Org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                         ))
(package-initialize)

(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisps")))

(require 'misc)
(require 'buildin-cfg)
(require 'aux-utils-cfg)
(require 'theme-cfg)

(require 'editor-cfg)

(require 'common-ide-cfg)
(require 'lisp-ide-cfg)
(require 'cxx-ide-cfg)
(require 'cmake-ide-cfg)
(require 'golang-ide-cfg)
(require 'lua-ide-cfg)
(require 'json-ide-cfg)
(require 'ruby-ide-cfg)
(require 'python-ide-cfg)
(require 'protobuf-ide-cfg)
(require 'sql-ide-cfg)

(require 'crontab-ide-cfg)
(require 'markdown-ide-cfg)
(require 'docker-ide-cfg)
(require 'tex-ide-cfg)
(require 'yaml-ide-cfg)

(require 'project-cfg)
(require 'vcs-cfg)
(require 'org-cfg)

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
;;  (when (not (string-match "pageant.exe" str))
;;    (when (executable-find "pageant")
;;      ;;  (shell-command-to-string "taskkill /IM pageant.exe")
;;      (start-process "pageant" nil "pageant")))))

;; Autotype Features for frequently-entered text.
;; Calc Calc is an advanced calculator and mathematical tool.

;; CC mode Mode for editing C, C++, Objective C, Java, Pike, and IDL code.
;; CL   GNU Emacs Common Lisp support.
;; D-Bus    Emacs API for using the D-Bus message bus system.
;; Dired-X  Extra Dired features.
;; Ebrowse  C++ class browser.
;; EDE  Package to simplify building and debugging programs.
;;  (require 'init-cedet)
;; EDT  EDT Emulator.
;; Ediff    Visual interface for comparing and merging programs.
;; EIEIO    Common Lisp Object System library for Emacs.
;; Emacs GnuTLS Emacs interface to the GnuTLS library.
;; Emacs MIME   Emacs library for composing and showing MIME messages.
;; EasyPG Assistant Emacs user interface to the GNU Privacy Guard.
;; ERC  Modular and extensible IRC client for Emacs.
;; ERT  The Emacs Lisp Regression Testing tool.
;; Eshell   Command shell implemented in Emacs Lisp.
;; EUDC The Emacs Unified Directory Client.
;; EWW  A web browser.
;; Forms    Mode for manipulating text forms.
;; Flymake  On-the-fly programming language syntax checker.
;; Gnus Mail and news reader.
;; Htmlfontify  Export buffers to HTML.
;; IDLWAVE  Major mode and shell for IDL and WAVE/CL files.
;; IDO  A package for interactively doing things.
;; Info The Info documentation browser.
;; Mairix   Emacs interface to the Mairix email indexing tool.
;; Message  Mail and news composition mode for Gnus.
;; MH-E Interface to the MH mail system.
;; Newsticker   A newsticker for Emacs.
;; nXML XML editing mode with RELAX NG support.
;; Octave mode  Major mode for GNU Octave code.
;; Org mode Outline-based note manager and organizer.
;; PCL-CVS  Front-end to CVS.
;; PGG  Obsolete interface library for secure communication; see EasyPG.
;; RCIRC    IRC client for Emacs.
;; RefTeX   Manage labels, references, citations and index entries.
;; Remember Tool for managing todo lists, schedules, and other data.
;; SASL Emacs interface to the SASL (Simple Authentication and Security Layer) framework.
;; Semantic Source code parsing utilities for Emacs.
;; Semantic parser (bovine) The original Semantic parser.
;; Semantic Recoder Converts information from Semantic back into code.
;; SES  The Simple Emacs Spreadsheet.
;; Sieve    Mode for the Sieve mail filtering language.
;; SMTP Emacs library for sending mail via SMTP.
;; Speedbar File and tag summarizing utility.
;; Supercite    Package for citing and attributing messages.
;; Todo mode    Keeping track of things to do.
;; URL  Library for manipulating and retrieving URLs and URIs.
;; 5 General Facilities
;; 5.2 Proxies and Gatewaying
;; (setq url-proxy-services
;;    '(
;;      ("http" . "127.0.0.1:10086")
;;      ("https" . "127.0.0.1:10086")
;;      ))

;; Vip  An older VI emulator.
;; Viper    VI emulator.
;; Widget   Library for graphical widgets.
;; Wisent   An Emacs implementation of the GNU Compiler Compiler Bison.
;; Woman    Browsing UN*X pages without man.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
