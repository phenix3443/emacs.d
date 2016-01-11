;;; init-paredit.el ---
;;
;; Filename: init-paredit.el
;; Description:
;; Author: phenix3443<phenix3443@gmail.com>
;; Maintainer: phenix3443
;; Created: 周三 十二月 24 11:19:44 2014 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated: 周四 10月 29 10:10:33 2015 (+0800)
;;           By: phenix
;;     Update #: 26
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

(require 'paredit)

(autoload 'enable-paredit-mode "paredit" t)

(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

(with-eval-after-load 'paredit
  (define-key paredit-mode-map (kbd "C-)") 'paredit-forward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-(") 'paredit-backward-slurp-sexp)
  (define-key paredit-mode-map (kbd "C-}") 'paredit-forward-barf-sexp)
  (define-key paredit-mode-map (kbd "C-{") 'paredit-backward-barf-sexp)
  (define-key paredit-mode-map (kbd "C-<right>") nil)
  (define-key paredit-mode-map (kbd "C-<left>")  nil))

;; (require-package 'paredit-everywhere)
;; (add-hook 'prog-mode-hook 'paredit-everywhere-mode)
;; (add-hook 'css-mode-hook 'paredit-everywhere-mode)

(provide 'init-paredit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-paredit.el ends here
