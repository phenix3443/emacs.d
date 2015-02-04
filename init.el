;;; init.el --- emacs init file
;; 
;; Filename: init.el
;; Description: 
;; Author: phenix3443<phenix3443@gmail.com>
;; Maintainer: 
;; Created: 周四 十二月 18 16:07:09 2014 (+0800)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated: 四  2月  5 01:07:33 2015 (+0800)
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

(when (equal system-type 'windows-nt)
  ;; 不要在emacs里面改动 PATH 和 exec-path
  (setenv "GTAGSCONF" (concat (getenv "HOME") "\\.emacs.d\\win_apps\\glo633wb\\share\\gtags\\gtags.conf"))
  (setenv "GTAGSLABEL" "pygments"))

;; use proxy for internet
;; (setq url-proxy-services
	  ;; '(
		;; ("http" . "127.0.0.1:8087")
		;; ("https" . "127.0.0.1:8087")))

;;加载配置文件，按照 https://www.gnu.org/software/emacs/manual/ 出现顺序
(defun load-package-init-files()
  "load most packages init files"
  (let ((default-directory "~/.emacs.d/lisps"))
	(normal-top-level-add-to-load-path '("."))
	(normal-top-level-add-subdirs-to-load-path))
  ;; GNU Emacs manual
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
  ;; GNU Emacs Lisp reference manual

  ;; GNU Emacs FAQ

  ;; GNU Emacs FAQ for MS Windows

  ;; Autotype
  (require 'init-header2)

  )
(add-hook 'after-init-hook 'load-package-init-files)
