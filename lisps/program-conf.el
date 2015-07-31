;;; program-conf.el --- related to programming
;;
;; Filename: program-conf.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer: phenix3443 <phenix3443@gmail.com>
;; Created:
;; Version:
;; Package-Requires: ()
;; Last-Updated: 周五 7月 31 12:59:05 2015 (+0800)
;;           By: chengxu70
;;     Update #: 31
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

;; 26.1 major mode for programming languages
;; 26.4 Commands for Editing with Parentheses
;; 26.4.3 matching parentheses
(show-paren-mode t)
(electric-pair-mode t)

;; 26.5.2 Multiple Lines of Comments

;; comment-dwim-line-version-1
(defun comment-dwim-line()
  (interactive)
  (let ((start (line-beginning-position))
		(end (line-end-position)))
	(when (region-active-p)
	  (setq start (save-excursion
					(goto-char (region-beginning))
					(beginning-of-line)
					(point))
			end (save-excursion
				  (goto-char (region-end))
				  (end-of-line)
				  (point))))
	(comment-or-uncomment-region start end)))

(global-set-key (kbd "C-;") 'comment-dwim-line)
;; 26.8 Completion for symbol names

;; 27.5 Finding Syntax Error on The Fly

;;28 tags

(provide 'program-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; program-conf.el ends here
