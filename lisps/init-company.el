;;; init-company.el ---
;;
;; Filename: init-company.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer:
;; Created: 周五 二月  6 11:08:17 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated: 周五 二月  6 11:38:41 2015 (+0800)
;;           By: chengxu70
;;     Update #: 7
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

(require 'company)

(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 2)

(setq company-backends
	  '(company-gtags
		company-yasnippet
		company-files
		company-dabbrev
		company-dabbrev-code
		company-etags
		company-semantic
		company-elisp
		))

(require-package 'company-c-headers)
(require 'company-c-headers)
(add-to-list 'company-c-headers-path-system "usr/include/c++")
(add-to-list 'company-backends 'company-c-headers)

(add-hook 'prog-mode-hook '(lambda()
							 (company-mode t)))
(provide 'init-company)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-company.el ends here
