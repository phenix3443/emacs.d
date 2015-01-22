;;; international-conf.el --- 
;; 
;; Filename: international-conf.el
;; Description: 
;; Author: phenix <phenix3443@gmail.com>
;; Maintainer: 
;; Created: 三  1月 21 22:42:59 2015 (+0800)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: 周四 一月 22 20:16:30 2015 (+0800)
;;           By: chengxu70
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
;; required by init.el

;; 22.3 Input Methods

(defun my-chinese-setup ()
  "Set up my private Chinese environment."
  (if (equal current-language-environment "Chinese-GBK")
	  (progn
		(require-package 'chinese-pyim)
		(require 'chinese-pyim)
		(setq pyim-dicts '((:name "BigDict" :file "~/.emacs.d/pyim/pyim-bigdict.txt" :coding utf-8-unix)))
		(setq default-input-method "chinese-pyim"))))

(add-hook 'set-language-environment-hook 'my-chinese-setup)

;; (require-package 'chinese-pyim)
;; (require 'chinese-pyim)
;; (setq pyim-dicts '((:name "BgiDict" :file "~/.emacs.d/pyim/pyim-bigdict.txt" :coding utf-8-unix)))
;; (setq default-input-method "chinese-pyim")

(provide 'international-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; international-conf.el ends here
