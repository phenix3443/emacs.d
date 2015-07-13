;;; files-conf.el ---
;;
;; Filename: files-conf.el
;; Description:
;; Author: phenix3443<phenix3443@gmail.com>
;; Maintainer:
;; Created: 周一 七月 13 11:17:49 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 10
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

;; File Name
;; Visiting

;; 18.3 Saving Files

;; 18.3.6 Updating Time Stamps Automatically
;(add-hook 'before-save-hook 'time-stamp)

;; 18.4 Reverting a Buffer

;; Autorevert

;; Auto save

;; 18.14 Remote Files
(require 'tramp)
(add-to-list 'tramp-default-method-alist '("" "phenix" "plink"))
(add-to-list 'tramp-default-user-alist '())
(if (equal system-type 'windows-nt)
	(setq tramp-default-method "plink"))
(setq tramp-default-user "phenix")
(setq tramp-default-host "192.168.40.134")
;; (require 'auth-source)
;; (add-to-list 'tramp-default-proxies-alist '(nil "\\'root\\'" "/ssh:%h:"))
(provide 'files-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; files-conf.el ends here
