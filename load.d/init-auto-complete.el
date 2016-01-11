(require 'req-package)
(req-package auto-complete
  :require popup pos-tip popwin
  :config

  ;; 3.2 install script
  (require 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default)

  ;; Candidate Suggestion
  (setq ac-comphist-file "~/.emacs.d/tmp-dir/ac-comphist.dat")
  ;; 5.6.1 completion by dictionary
  (setq ac-user-dictionary-files "~/.emacs.d/tmp-dir/.dict")
  ;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

  ;; 6.1 using sources
  (set-default 'ac-sources
			   '(ac-source-words-in-buffer
				 ac-source-words-in-same-mode-buffers))

  (defun ac-4-prog-mode()
	(setq ac-sources (append '(ac-source-yasnippet
							   ac-source-gtags
							   ac-source-semantic
							   ac-source-imenu) ac-sources)))
  (add-hook 'prog-mode-hook 'ac-4-prog-mode)

  (defun ac-4-emacs-lisp-mode()
	(setq ac-sources (append '(ac-source-abbrev
							   ac-source-dictionary
							   ac-source-features
							   ac-source-filename
							   ac-source-functions
							   ac-source-symbols
							   ac-source-variables) ac-sources)))
  (add-hook 'emacs-lisp-mode-hook 'ac-4-emacs-lisp-mode)

  (defun ac-4-c-cpp-mode ()
	(setq ac-sources (append '() ac-sources))
	(setq ac-omni-completion-sources (list (cons "\\." '(ac-source-semantic))
										   (cons "->" '(ac-source-semantic)))))

  (add-hook 'c-mode-common-hook 'ac-4-c-cpp-mode)

  (defun ac-4-css-mode ()
	(setq ac-sources (append '(ac-source-css-property) ac-sources)))

  ;; 7 tips
  ;; 7.1
  (setq ac-auto-start 2)
  ;; 7.6 not to use quick help
  (setq ac-use-quick-help nil)

  ;; 7.7. Change a height of completion menu
  ;;(setq ac-menu-height 20)

  ;; 7.8  Enable auto-complete-mode automatically for specific modes
  ;;(setq ac-modes (append '(prog-mode) ac-modes))

  ;; 7.9 Ignore case
  (setq ac-ignore-case 'smart)

  ;; 7.17. Show help beautifully

  (setq ac-quick-help-prefer-pos-tip t)

  ;; 8.1 Delay time to start completion in real number seconds
  (setq ac-delay 0.3)
  ;; 8.2 Show completion menu automatically
  (setq ac-auto-show-menu t)
  ;; 8.3 show completion menu immediately on auto-complete command
  (setq ac-show-menu-immediately-on-auto-complete t)
  ;; 8.4 expand a common part of whole candidates
  (setq ac-expand-on-auto-complete t)
  ;; 8.6 stop Flymake on completion
  (setq ac-stop-flymake-on-completing t)
  ;; 8.7 use fuzzy matching
  (require-package 'fuzzy)
  (setq ac-use-fuzzy t)
  ;; 8.9 use candidate suggestion
  (setq ac-comphist t)
  ;; 8.12. use quick help
  (setq ac-use-quick-help t)
  ;; 8.13 Delay time to show quick help in real number seconds.
  (setq ac-quick-help-delay 3.0)
  ;; 8.25 "Do What I Mean" function
  (setq ac-dwim t)

  (add-hook 'prog-mode-hook '(lambda() (auto-complete-mode t)))

  ;; key binding
  (ac-set-trigger-key "TAB")
  (ac-set-trigger-key "<tab>")
  ;; (global-set-key (kbd "C-i") 'auto-expand)
  ;; (global-set-key (kbd "C-m") 'auto-complete)

  (define-key ac-completing-map (kbd "M-/") 'ac-stop)

  (define-key ac-menu-map (kbd "C-n") 'ac-next)
  (define-key ac-menu-map (kbd "C-p") 'ac-previous)

)

(provide 'init-auto-complete)
