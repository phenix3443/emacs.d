;;; package --- summary  emacs 內建配置
;;; commentary:

;;; code:
;; 7.2 change the location of point
(setq track-eol t)
;; 8.4 Completion
;; 12.3 cut and paste

;; 12.6 CUA
;; 14.3 Automatic Scrolling
(setq scroll-conservatively 10000)
;;(set-face-attribute 'linum nil :height 100)
;; 14.5 narrow
(put 'narrow-to-region 'disabled nil)
;; 14.12 Font Lock mode
(add-hook 'prog-mode-hook 'font-lock-mode)

;; 14.13 interactive highlight
;;(global-highlight-changes-mode 1)
(global-hi-lock-mode 1)
(setq hi-lock-auto-select-face t)

;; 14.16 Useless Whitespace
(setq show-trailing-whitespace t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indicate-empty-lines t)

;; 14.18 optional mode line features
(size-indication-mode 1)

;; (global-linum-mode t)
(column-number-mode t)

(setq display-time-24hr-format t)
(setq display-time-default-load-average nil)
(display-time-mode 1)

(setq display-time-format "%m/%d %R %u")

(display-battery-mode t)

;; 14.20 Curssor Display
(global-hl-line-mode t)
(setq-default cursor-type 'bar)
;; Set any color as the background face of the current line:
(set-face-background 'hl-line "#3e4446")
;; To keep syntax highlighting in the current line:
(set-face-foreground 'highlight nil)

;; 14.22 Visual Line mode
(global-visual-line-mode t)
(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
;; 14.23 customization of display

;; 20.7 Convenience Features for Window Handling
(winner-mode 1)

;; 21.8 Fonts


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
(if window-system
    (tool-bar-mode -1)
  )

;; 21.16 Dialog Boxes
;; 21.17 Tooltips
;; 21.18 Mouse Avoidance
(mouse-avoidance-mode 'animate)
;; 21.19 Non-Window Terminals
;; 21.20 Text-Only Mouse

;;; 24 Indentation
;; 24.2 Tab Stops
;; (setq-default tab-stop-list (number-sequelnce 4 120 4))
;; 24.3 Tabs vs Spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(defun untabify-buffer ()
  "Untabify current buffer."
  (interactive)
  (untabify (point-min) (point-max)))

;; 24.4 Convenience Features for Indentation
(setq tab-always-indent 'complete)
(electric-indent-mode t)

;; 25.2 sentences
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 25.5 Filling Text
(set-default 'fill-column 80)
;; (add-hook 'org-mode-hook 'turn-on-auto-fill)
;; (setq-default auto-fill-function 'do-auto-fill)

;; 25.9 Org mode

;; 25.10 TeX Mode
;; 25.10.3 TeX Printing Command
;; (setq latex-run-command "xelatex")

;; 26.1 major mode for programming languages
;; 26.2.4 Which Function Mode
(which-function-mode 1)
;; 26.4 Commands for Editing with Parentheses
;; 26.4.3 matching parentheses
(show-paren-mode t)
(setq show-paren-style 'expression)

(electric-pair-mode t)
(setq electric-pair-preserve-balance t)
(setq electric-pair-delete-adjacent-pairs t)
(setq electric-pair-open-newline-between-pairs t)
(setq electric-pair-skip-whitespace t)

;; (defvar markdown-electric-pairs '((?* . ?*)) "Electric pairs for markdown-mode")
;; (defun markdown-add-electric-pairs ()
;;   (setq-local electric-pair-pairs (append electric-pair-pairs markdown-electric-pairs)))
;; (add-hook 'markdown-mode-hook 'markdown-add-electric-pairs)


;; 26.5.2 Multiple Lines of Comments

;; 26.6.3 Emacs Lisp Documentation Lookup
(add-hook 'emacs-lisp-mode-hook (lambda () (eldoc-mode t)))

;; 26.7 Hideshow minor mode
(add-hook 'prog-mode-hook 'hs-minor-mode)
;; 26.8 Completion for symbol names

;; 26.9 MixedCase Words
;; (global-subword-mode 1)

;; 26.11 Other Features Useful for Editing Programs
;; (add-to-list 'electric-layout-rules '(?{ . around))
(electric-layout-mode t)
;; (global-prettify-symbols-mode t)


;; 27.1 Running Compilations under Emacs
(setq compilation-scroll-output 'first-error)
;; 27.5 Finding Syntax Error on The Fly

;;29.5 Frame Title
(setq frame-title-format '("%*" " " "%f"))

;;42 saving emacs sessions
(desktop-save-mode 1)

;; 48.1.4 Saving Customizations
(setq custom-file "~/.emacs.d/emacs-custom.el")

;; 48.1.7 custom themes
;; (setq custom-enabled-themes '(sanityinc-tomorrow-eighties))

;; 50.2 Package Installation


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 以下内容在 emacs manual 中没有找到
;; (global-superword-mode)

(provide 'buildin-cfg)
;;; buildin-cfg.el ends here
