;;; text-conf.el --- 
;; 
;; Filename: text-conf.el
;; Description: 
;; Author: phenix34433 <phenix3443@gmail.com>
;; Maintainer: 
;; Created: 周三 十二月 24 11:07:52 2014 (+0800)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: 周六 三月  7 16:35:56 2015 (+0800)
;;           By: chengxu70
;;     Update #: 6
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

;; 25.2 sentences
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;;;25.10 TeX Mode
;; org-mode使用的cdlatex用到了auctex自带的texmathp，所以该文件调用在init-org之前。
(require 'init-auctex)

;; 25.9 Org mode
(require 'init-org)
(require 'init-org2blog)

;; add space between Chinese and English characters.
(require-package 'pangu-spacing)
(require 'pangu-spacing)
(global-pangu-spacing-mode 1)
(pangu-spacing-modify-buffer)

(provide 'text-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; text-conf.el ends here
