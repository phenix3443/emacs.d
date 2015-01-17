;;; indentation-conf.el --- 
;; 
;; Filename: indentation-conf.el
;; Description: 
;; Author: phenix3443(phenix3443@gmail.com)
;; Maintainer: 
;; Created: 周六 一月 17 10:10:24 2015 (+0800)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: 周六 一月 17 10:16:06 2015 (+0800)
;;           By: chengxu70
;;     Update #: 3
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

;;24.3 Tabs vs Spaces
(add-hook 'prog-mode-hook
		  '(lambda()
			 (setq tab-width 4)))
;;24.4 convenience feature for indentation
(setq tab-always-indent 'complete)
(electric-indent-mode t)
(provide 'indentation-conf)

;;; show vertical lines to guide indentation
(require-package 'indent-guide)
(indent-guide-global-mode)
(setq indent-guide-delay 0.1)
(setq indent-guide-recursive t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; indentation-conf.el ends here
