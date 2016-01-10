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
;;     Update #: 37
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

(require 'helm-gtags)

(add-hook 'prog-mode-hook 'helm-gtags-mode)

(custom-set-variables
 '(helm-gtags-parse-file 'root)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-read-only t)
 '(helm-gtags-use-input-at-cursor t)
 '(helm-gtags-highlight-candidate t)
 '(helm-gtags-display-style 'detail)
 '(helm-gtags-auto-update t)
 '(helm-gtags-update-interval-second 60)
 '(helm-gtags-cache-select-result t)
 '(helm-gtags-pulse-at-cursor t)
 '(helm-gtags-fuzzy-match nil)
 '(helm-gtags-direct-helm-completing t)
 '(helm-gtags-prefix-key (kbd "C-c g"))
)

;; key bindings
(with-eval-after-load "helm-gtags"
  (let ((prefix helm-gtags-prefix-key))
	(define-key helm-gtags-mode-map (concat prefix "a") 'helm-gtags-tags-in-this-function)
	(define-key helm-gtags-mode-map (concat prefix "A") 'helm-gtags-select)
	(define-key helm-gtags-mode-map (concat prefix "b") 'helm-gtags-pop-stack)
	(define-key helm-gtags-mode-map (concat prefix "c") 'helm-gtags-clear-stack)
	(define-key helm-gtags-mode-map (concat prefix "C") 'helm-gtags-clear-all-stacks)
	(define-key helm-gtags-mode-map (concat prefix "d") 'helm-gtags-display-browser)
	(define-key helm-gtags-mode-map (concat prefix "f") 'helm-gtags-find-files)
	(define-key helm-gtags-mode-map (concat prefix "F") 'helm-gtags-parse-file)
	(define-key helm-gtags-mode-map (concat prefix "g") 'helm-gtags-create-tags)
	(define-key helm-gtags-mode-map (concat prefix "h") 'helm-gtags-find-tag-from-here)
	(define-key helm-gtags-mode-map (concat prefix "n") 'helm-gtags-next-history)
	(define-key helm-gtags-mode-map (concat prefix "p") 'helm-gtags-previous-history)
	(define-key helm-gtags-mode-map (concat prefix "P") 'helm-gtags-pop-stack)
	(define-key helm-gtags-mode-map (concat prefix "r") 'helm-gtags-find-rtag)
	(define-key helm-gtags-mode-map (concat prefix "R") 'helm-gtags-resume)
	(define-key helm-gtags-mode-map (concat prefix "s") 'helm-gtags-find-symbol)
	(define-key helm-gtags-mode-map (concat prefix "S") 'helm-gtags-show-stack)
	(define-key helm-gtags-mode-map (concat prefix "t") 'helm-gtags-find-tag)
	(define-key helm-gtags-mode-map (concat prefix "4 t") 'helm-gtags-find-tag-other-window)
	(define-key helm-gtags-mode-map (concat prefix "u") 'helm-gtags-update-tags)
	(define-key helm-gtags-mode-map (concat prefix ".") 'helm-gtags-dwim)
	))

(provide 'init-helm-gtags)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-helm-gtags.el ends here
