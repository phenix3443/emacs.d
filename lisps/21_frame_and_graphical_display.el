;; -*- coding:utf-8; -*-

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
;; (menu-bar-mode -1)
;; 21.15 Toolbar
(tool-bar-mode)

;; 21.16 Dialog Boxes
;; 21.17 Tooltips
;; 21.18 Mouse Avoidance
(mouse-avoidance-mode 'animate)
;; 21.19 Non-Window Terminals
;; 21.20 Text-Only Mouse


;;29.5 Frame Title
(setq frame-title-format '("%*" " " "%f"))

(provide '21_frame_and_graphical_display)
