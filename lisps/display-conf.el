; Time-stamp: <2014-08-11 00:31:30 phenix>

;(set-face-attribute 'linum nil :height 100)

; 14.13 interactive highlight
;(global-highlight-changes-mode 1)
(global-hi-lock-mode 1)

;; 14.18 optional mode line features
(global-linum-mode t)
(column-number-mode t)

(display-time-mode 1)
(setq display-time-format "%D %a %H:%M")


;; If not on AC power line, then display battery status on the mode line
;(and (require 'battery nil t)
;     (functionp battery-status-function)
;     (or (equal (cdr (assoc ?L (funcall battery-status-function))) "on-line")
;		  (display-battery-mode)))

;; 14.20 Curssor Display
(global-hl-line-mode t)
(setq-default cursor-type 'bar)

;; 14.22 Visual Line mode
(global-visual-line-mode t)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
;; 14.23 customization of display

(provide 'display-conf)
