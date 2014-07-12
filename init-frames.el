;;Time-stamp: <2014-07-12 01:18:08 phenix>

;;;21.11 Frame Parameters
(add-to-list 'default-frame-alist '(width . 90))
;trasparent
;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))
(transparency 100)
;;;21.12 Scroll Bars
;;;Drag and  Drop
;;;Menu Bars

;;;Toolbar
(tool-bar-mode -1)

;;;Dialog Boxes
;;;Tooltips
;;;21.18 Mouse Avoidance
(mouse-avoidance-mode 'animate)
;;;Non-Window Terminals
;;;Text-Only Mouse


;;;(elisp)29.5 Frame Title
(setq frame-title-format '("%*" " " "%f"))

(provide 'init-frames)
