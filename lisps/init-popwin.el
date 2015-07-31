;;; init-popwin.el ---
;;
;; Filename: init-popwin.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer: phenix3443
;; Created: 周五 7月 31 17:26:38 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 2
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
(require-package 'popwin)

(require 'popwin)

(setq popwin:special-display-config nil)
(setq display-buffer-function 'popwin:display-buffer)

; enable popwin-mode globally is too dangerous
(add-to-list 'popwin:special-display-config '("*Help*"))
(add-to-list 'popwin:special-display-config '("*Completions*" :noselect t))
(add-to-list 'popwin:special-display-config '("*compilation*" :noselect t))
(add-to-list 'popwin:special-display-config '("*Occur*" :noselect t))
(add-to-list 'popwin:special-display-config '("*Backtrace*"))
(add-to-list 'popwin:special-display-config '("*Remember*" :stick t))
(add-to-list 'popwin:special-display-config '("*Org Agenda*"))
(add-to-list 'popwin:special-display-config '("*sdic*" :noselect))
(add-to-list 'popwin:special-display-config '("*Apropos*"))
(add-to-list 'popwin:special-display-config '("*Warnings*"))
(add-to-list 'popwin:special-display-config '(" *auto-async-byte-compile*" :noselect))

(provide 'init-popwin)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-popwin.el ends here
