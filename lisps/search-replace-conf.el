;;; search-replace-conf.el --- searching and replacement config
;; 
;; Filename: search-replace-conf.el
;; Description: 
;; Author: phenix3443<phenix3443@gmail.com>
;; Maintainer: 
;; Created: 周六 12月 20 00:46:02 2014 (+0800)
;; Version: 1.0
;; Package-Requires: ()
;; Last-Updated: 周六 12月 20 00:55:43 2014 (+0800)
;;           By: phenix
;;     Update #: 2
;; URL: 
;; Doc URL: 
;; Keywords: search replace multiply-cursors
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

(require-package 'multiple-cursors)
(require 'multiple-cursors)
(global-set-key (kbd "C-m e") 'mc/edit-lines)
(global-set-key (kbd "C-m p") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-m n") 'mc/mark-next-like-this)
(global-set-key (kbd "C-m a") 'mc/mark-all-like-this)

(provide 'search-replace-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; search-replace-conf.el ends here
