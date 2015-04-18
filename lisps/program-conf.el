;;; program-conf.el --- related to programming
;; 
;; Filename: program-conf.el
;; Description: 
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer: 
;; Created: ÖÜÁù 12ÔÂ 20 00:50:11 2014 (+0800)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: 周六 4月 18 11:00:45 2015 (+0800)
;;           By: phenix
;;     Update #: 22
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

;;26.1 major mode for programming languages
;; 26.4 Commands for Editing with Parentheses
;; 26.4.3 matching parentheses
(show-paren-mode t)
(electric-pair-mode t)
;; (require 'init-paredit)
(require 'init-smartparens)

;;26.5.2 Multiple Lines of Comments
(defun comment-dwin-line()
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
(global-set-key (kbd "C-;") 'comment-dwin-line)
;;26.8 Completion for symbol names
(require 'init-yasnippet)
;;auto-complete configure
;;(require 'init-popwin)
;;(require 'init-company)
(require 'init-auto-complete)
;;27.5 Finding Syntax Error on The Fly
(require 'init-flycheck)

;;project support
(require 'init-projectile)
(require 'init-cedet)


;;28 tags
(require 'init-helm-gtags)

;; Lua mode
(require-package 'lua-mode)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 4)

;; python mode
(require-package 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; c sharp mode
(require-package 'csharp-mode)

;; mardown mode
(require 'init-markdown)


(provide 'program-conf)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; program-conf.el ends here
