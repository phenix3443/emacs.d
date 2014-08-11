; Time-stamp: <2014-08-11 11:30:37 chengxu70>
;

;(setq window-system-default-frame-alist '() )

; trasparent transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "Transparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
(transparency 100)

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


										; (elisp)29.5 Frame Title
(setq frame-title-format '("%*" " " "%f"))

(provide 'frames-conf)
