; Time-stamp: <2014-08-09 16:54:46 chengxu70>

;; 21.8 Fonts
(defun font-candidate (&rest fonts)
  "Return existing font which first match."
  (cl-find-if (lambda (f) (find-font (font-spec :name f))) fonts))

;chinese font
(set-frame-font (font-candidate  "DejaVu Sans Mono-14" "Consolas-14"))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "Microsoft Yahei"
                                       :size 14)))
;;
;(let ((en-font (font-candidate "DejaVu Sans Mono-14" "Consolas-14")) 
;	  (zh-font (font-candidate "Microsoft Yahei-14")))
;  ; set en-font
;  (add-to-list 'init-frame-alist '(font . en-font))
;  (add-to-list 'default-frame-alit '(font .en-font)))
;  ; set zh-font
;  (dolist (charset '(kana han symbol cjk-misc bopomofo))
;	(set-fontset-font (frame-parameter nil 'font)
;					  charset (font-spec :family zh-font
;										 :size 14))))
;(setq initial-frame-alist '())
;(setq default-frame-alist '((width . 100) (alpha . 100)))
;(setq minibuffer-frame-alist '())
;(setq window-system-default-frame-alist '() )


; trasparent transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-pearameter (selected-frame) 'alpha value))
(transparency 100)
;; 21.12 Scroll Bars
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
