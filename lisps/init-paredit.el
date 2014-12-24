;;; init-paredit.el --- 
;; 
;; Filename: init-paredit.el
;; Description: 
;; Author: phenix3443<phenix3443@gmail.com>
;; Maintainer: 
;; Created: 周三 十二月 24 11:19:44 2014 (+0800)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: 周四 12月 25 00:52:26 2014 (+0800)
;;           By: phenix
;;     Update #: 9
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

(require-package 'paredit)
(autoload 'enable-paredit-mode "paredit")
(add-hook 'prog-mode-hook 'enable-paredit-mode)

(eval-after-load 'paredit
  '(progn
	 (dolist (binding (list (kbd "C-<left>") (kbd "C-<right>")
							(kbd "C-M-<left>") (kbd "C-M-<right>")))
	   (define-key paredit-mode-map binding nil))))

;; (require-package 'paredit-everywhere)
;; (add-hook 'prog-mode-hook 'paredit-everywhere-mode)
;; (add-hook 'css-mode-hook 'paredit-everywhere-mode)

(provide 'init-paredit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-paredit.el ends here
