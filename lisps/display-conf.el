;;; display-conf.el ---
;;
;; Filename: display-conf.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer: phenix3443
;; Created: 三  1月 21 03:33:18 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated: 周五 7月 31 12:05:05 2015 (+0800)
;;           By: chengxu70
;;     Update #: 8
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
;; required by program-conf.el
;;14.3 Automatic Scrolling
(setq scroll-conservatively 10000)
;;(set-face-attribute 'linum nil :height 100)
;; 14.12 Font Lock mode
(add-hook 'prog-mode-hook 'font-lock-mode)
;; 14.13 interactive highlight
;;(global-highlight-changes-mode 1)
(global-hi-lock-mode 1)

;; 14.16 Useless Whitespace
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indicate-empty-lines t)

;; 14.18 optional mode line features
(global-linum-mode t)
(column-number-mode t)

(display-time-mode 1)
(setq display-time-format "%D %a %H:%M")


;; If not on AC power line, then display battery status on the mode line
;;(and (require 'battery nil t)
;;     (functionp battery-status-function)
;;     (or (equal (cdr (assoc ?L (funcall battery-status-function))) "on-line")
;;		  (display-battery-mode)))

;; 14.20 Curssor Display
(global-hl-line-mode t)
(setq-default cursor-type 'bar)

;; 14.22 Visual Line mode
(global-visual-line-mode t)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
;; 14.23 customization of display

(provide 'display-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; display-conf.el ends here
