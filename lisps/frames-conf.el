;;; frames-conf.el ---
;;
;; Filename: frames-conf.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer: phenix3443
;; Created: 周四 7月 30 20:10:34 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated:
;;           By:
;;     Update #: 2
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

;; 21.8 Fonts
(require 'cl)
(defun font-candidate (&rest fonts)
  "Return existing font which first match."
  (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(let ((en-font (font-candidate "DejaVu Sans Mono-14" "Consolas-14"))
      (zh-font (font-candidate "Microsoft Yahei-14" "文泉驿微米黑 14")))
  ;;set en-font
  (setq default-frame-alist (list (cons 'font en-font)))
  ;; set zh-font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font "fontset-default" charset zh-font)))

;;(setq window-system-default-frame-alist '() )

;;trasparent transparency of emacs
;; (defun transparency (value)
;;   "Sets the transparency of the frame window. 0=transparent/100=opaque"
;;   (interactive "Transparency Value 0 - 100 opaque:")
;;   (set-frame-parameter (selected-frame) 'alpha value))
;; (transparency 100)

;; 21.12 Scroll Bars
(set-scroll-bar-mode nil)
;; 21.13 Drag and  Drop
;; 21.14 Menu Bars

;; 21.15 Toolbar
(tool-bar-mode -1)

;; 21.16 Dialog Boxes
;; 21.17 Tooltips
;; 21.18 Mouse Avoidance
(mouse-avoidance-mode 'animate)
;; 21.19 Non-Window Terminals
;; 21.20 Text-Only Mouse


;;29.5 Frame Title
(setq frame-title-format '("%*" " " "%f"))

(provide 'frames-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; frames-conf.el ends here
