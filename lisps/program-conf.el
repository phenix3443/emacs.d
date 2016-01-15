;; 26.1 major mode for programming languages
;; 26.4 Commands for Editing with Parentheses
;; 26.4.3 matching parentheses
(show-paren-mode t)
(electric-pair-mode t)

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
;; 26.7 Hideshow minor mode
(add-hook 'prog-mode-hook 'hs-minor-mode)
;; 26.8 Completion for symbol names

;; 26.11 Other Features Useful for Editing Programs
(add-hook 'prog-mode-hook ((lambda ()
							 (superword-mode t)
							 (electric-layout-mode t))))
;; (global-prettify-symbols-mode t)
;; 27.5 Finding Syntax Error on The Fly

;; 28 tags

(provide 'program-conf)
