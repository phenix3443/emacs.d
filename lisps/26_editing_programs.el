;; -*- coding:utf-8; -*-

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

(defvar markdown-electric-pairs '((?* . ?*)) "Electric pairs for markdown-mode")
(defun markdown-add-electric-pairs ()
  (setq-local electric-pair-pairs (append electric-pair-pairs markdown-electric-pairs)))
(add-hook 'markdown-mode-hook 'markdown-add-electric-pairs)


;; 26.5.2 Multiple Lines of Comments

;; comment-dwim-line-version-1
(defun comment-dwim-line()
  (interactive)
  (let ((start (line-beginning-position))
		(end (line-end-position)))
	(when (region-active-p)
	  (setq start (save-excursion
					(goto-char (region-beginning))
					(beginning-of-line)
					(point))
			end (save-excursion
				  (goto-char (region-end))
				  (end-of-line)
				  (point))))
	(comment-or-uncomment-region start end)))

(global-set-key (kbd "C-;") 'comment-dwim-line)
;; 26.6.3 Emacs Lisp Documentation Lookup
(add-hook 'emacs-lisp-mode-hook (lambda () (eldoc-mode t)))

;; 26.7 Hideshow minor mode
(add-hook 'prog-mode-hook 'hs-minor-mode)
;; 26.8 Completion for symbol names

;; 26.9 MixedCase Words
(global-subword-mode 1)
;; 26.11 Other Features Useful for Editing Programs
(electric-layout-mode t)
;; (global-prettify-symbols-mode t)
;; 27.5 Finding Syntax Error on The Fly

(provide '26_editing_programs)
