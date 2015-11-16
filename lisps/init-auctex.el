;;; init-auctex.el ---
;;
;; Filename: init-auctex.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer: phenix3443
;; Created: 周六 三月  7 16:12:38 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 1
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

(require-package 'auctex)
;; 1.3  5.3
(setq TeX-auto-save t)
(setq TeX-PDF-mode t)
(setq TeX-view-program-selection '((output-pdf "Okular")))

;; 2.5 Entering Mathematics
;; (add-hook 'LaTeX-mode-hook 'LaTex-math-mode)
;; 2.6 Completion

;; 2.10 Filling
;; (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
;; 3.2 Folding

;; 4.1.2
(add-hook'LaTeX-mode-hook
 '(lambda ()
	(setq TeX-engine 'xelatex)))
(add-hook'LaTeX-mode-hook (lambda()
							(add-to-list'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
							(setq TeX-command-default "XeLaTeX")
							(setq TeX-save-query  nil )
							(setq TeX-show-compilation nil)
							(flyspell-mode t)
							))


(setq tex-compile-commands '(("xelatex %r")))
(setq tex-command "xelatex")
;; (setq LaTeX-math-menu-unicode t)

;; 4.6
(setq TeX-clean-confirm nil)

;; 5.2 Multifile Documents
(setq Tex-save-query nil)
;; 5.3  Automatic Parsing of TeX Files
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(provide 'init-auctex)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-auctex.el ends here
