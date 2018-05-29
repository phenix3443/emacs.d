;;; package --- summary  一些实用的函数
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package auctex
  :ensure t
  :mode ("\\.tex\\'" . latex-mode)
  :commands (latex-mode LaTeX-mode plain-tex-mode)
  :config
  ;; 1.3 Quick Start
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq TeX-PDF-mode t)
  (setq TeX-view-program-selection '((output-pdf "Okular")))

  ;; 2.5 Entering Mathematics
  ;; (add-hook 'LaTeX-mode-hook 'LaTex-math-mode)
  ;; 2.6 Completion

  ;; 2.10 Filling
  ;; (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
  ;; 3.2 Folding

  ;; 4.1.2
  (add-hook'LaTeX-mode-hook '(lambda () (setq TeX-engine 'xelatex)))
  (add-hook'LaTeX-mode-hook (lambda()
                              (add-to-list'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
                              (setq TeX-command-default "XeLaTeX")
                              (setq TeX-save-query  nil )
                              (setq TeX-show-compilation nil)
                              (flyspell-mode t)
                              ))


  (setq tex-compile-commands '(("xelatex %r")))
  (setq tex-command "xelatex")
  ;; (setq LaTeX-math-menu-unicode t)

  ;; 4.6
  (setq TeX-clean-confirm nil)

  ;; 5.2 Multifile Documents
  (setq Tex-save-query nil)
  ;; 5.3  Automatic Parsing of TeX Files
  )

(use-package cdlatex
  :ensure t)

(provide 'tex-ide-cfg)
;;; tex-ide-cfg.el ends here
