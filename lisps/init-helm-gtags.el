;;; init-helm-gtags.el ---
;;
;; Filename: init-helm-gtags.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer:
;; Created: 三  5月  6 00:38:51 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
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

;;; https://https://github.com/syohex/emacs-helm-gtags
;;; required by program-conf.el

(require-package 'helm-gtags)

(add-hook 'prog-mode-hook 'helm-gtags-mode)

(custom-set-variables
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-use-input-at-cursor t)
 '(helm-gtags-pulse-at-cursor t)
 '(helm-gtags-prefix-key (kbd "C-c g"))
 '(helm-gtags-suggested-key-mapping t))

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
	 (let ((prefix helm-gtags-prefix-key))
	   (define-key helm-gtags-mode-map (concat prefix "a") 'helm-gtags-tags-in-this-function)
	   (define-key helm-gtags-mode-map (concat prefix "c") 'helm-gtags-create-tags)
	   (define-key helm-gtags-mode-map (concat prefix "u") 'helm-gtags-update-tags)
	   (define-key helm-gtags-mode-map (concat prefix "h") 'helm-gtags-display-browser)
	   (define-key helm-gtags-mode-map "\C-]" 'helm-gtags-find-tag-from-here)
	   (define-key helm-gtags-mode-map "\C-t" 'helm-gtags-pop-stack)
	   (define-key helm-gtags-mode-map (concat prefix "P") 'helm-gtags-find-files)
	   (define-key helm-gtags-mode-map (concat prefix "f") 'helm-gtags-parse-file)
	   (define-key helm-gtags-mode-map (concat prefix "g") 'helm-gtags-find-pattern)
	   (define-key helm-gtags-mode-map (concat prefix "s") 'helm-gtags-find-symbol)
	   (define-key helm-gtags-mode-map (concat prefix "r") 'helm-gtags-find-rtag)
	   (define-key helm-gtags-mode-map (concat prefix "d") 'helm-gtags-find-tag)
	   (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
	   ;; common
	   (define-key helm-gtags-mode-map "\e*" 'helm-gtags-pop-stack)
	   (define-key helm-gtags-mode-map "\C-x4." 'helm-gtags-find-tag-other-window))))
(require 'helm-gtags)

(provide 'init-helm-gtags)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-helm-gtags.el ends here
