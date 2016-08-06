;; -*- coding:utf-8; -*-

;; 25.2 sentences
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 25.5 Filling Text
;; (add-hook 'org-mode-hook 'turn-on-auto-fill)
;; (setq-default auto-fill-function 'do-auto-fill)
;; 25.9 Org mode

;; 25.10 TeX Mode
;; 25.10.3 TeX Printing Command
;; (setq latex-run-command "xelatex")

(provide '25_commands_for_human_languages)
