;; -*- coding:utf-8; -*-

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
(size-indication-mode 1)

(global-linum-mode t)

(column-number-mode t)

(setq display-time-24hr-format t)
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

(provide '14_controlling_and_display)
