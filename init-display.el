;;Time-stamp: <2014-07-14 11:01:14 chengxu70>

;;;Scrolling
(set-scroll-bar-mode nil) 

;;;View mode

;;;Text Display

;;;14.20 Curssor Display
(global-hl-line-mode t)
(setq-default cursor-type 'bar) 
;;;14.21 line truncation

;;;14.22 Visual Line mode
(global-visual-line-mode t) ;line wrap in screen line
;;14.23 customization of display

;;optional mode line features
(column-number-mode t)

(display-time-mode 1)
(setq display-time-format "%D %a %H:%M")

;; If not on AC power line, then display battery status on the mode line
(and (require 'battery nil t)
     (functionp battery-status-function)
     (or (equal (cdr (assoc ?L (funcall battery-status-function))) "on-line")
		  (display-battery-mode)))



(provide 'init-display)
