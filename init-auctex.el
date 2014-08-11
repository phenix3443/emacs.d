; Time-stamp: <2014-08-11 15:03:33 chengxu70>

; default from auctex-manual 
;; 1.3  5.3
(setq TeX-auto-save t)


;; 2.5 Entering Mathematics
(add-hook 'LaTeX-mode-hook 'LaTex-math-mode)
;; 2.6 Completion

;; 2.10 Filling 
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
;; 3.2 Folding
(add-hook 'LaTeX-mode-hook (lambda ()
							  (TeX-fold-mode 1)))
;; 4.1.3 TeX-engine
(setq TeX-engine 'xetex)
(setq TeX-show-compilation t)
;; 4.6
(setq TeX-clean-confirm nil)

;; 5.2 Multifile Documents
(setq Tex-save-query nil)
; 5.3  Automatic Parsing of TeX Files
(setq TeX-parse-self t)
(setq-default TeX-master nil)



(provide 'init-auctex)
