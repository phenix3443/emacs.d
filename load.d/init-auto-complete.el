;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package auto-complete
  :ensure t
  :config
  ;; 3.2 install script
  (require 'auto-complete)
  (require 'auto-complete-config)
  ;; (ac-config-default)

  ;; 4.5 Help
  (setq ac-use-quick-help t)
  (setq ac-quick-help-delay 3.0)

  ;; 5.4 Trigger Key
  ;; (ac-set-trigger-key "TAB")
  ;; Candidate Suggestion
  (setq ac-comphist-file "~/.emacs.d/auto-complete/ac-comphist.dat")
  ;; 5.6.1 completion by dictionary
  (add-to-list 'ac-user-dictionary-files
			   "~/.emacs.d/auto-complete/user.dict")
  ;; 5.6.2 Major Mode Dictionary and Extension Dictionary
  (add-to-list 'ac-dictionary-directories
			   "~/.emacs.d/auto-complete/")
  ;; 6 source
  ;; 6.1 using sources
  ;; 6.2 Builtin Sources
  (set-default 'ac-sources
			   '(ac-source-abbrev
				 ac-source-dictionary
				 ac-source-filename
				 ac-source-files-in-current-dir
				 ac-source-imenu
				 ac-source-words-in-all-buffer
				 ac-source-words-in-buffer
				 ac-source-words-in-same-mode-buffers
				 ac-source-yasnippet
				 ))

  (add-hook 'prog-mode-hook '(lambda ()
							   (append '(ac-source-gtags
										 ac-source-semantic
										 ac-source-semantic-raw)
									   ac-sources)))
  (add-hook 'emacs-lisp-mode-hook '(lambda ()
									 (append '(ac-source-features
											   ac-source-functions
											   ac-source-symbols
											   ac-source-variables)
											 ac-sources)))

  (add-hook 'css-mode-hook '(lambda ()
							  (append '(ac-source-css-property) ac-sources)))
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
  (setq ac-use-fuzzy t)
  ;; 8.9 use candidate suggestion
  (setq ac-comphist t)
  ;; 8.12. use quick help
  ;; (setq ac-use-quick-help t)
  ;; 8.13 Delay time to show quick help in real number seconds.
  ;; (setq ac-quick-help-delay 3.0)
  ;; 8.25 "Do What I Mean" function
  (setq ac-dwim t)

  ;; 9.34 global-auto-complete-mode
  (global-auto-complete-mode t)

  )

(provide 'init-auto-complete)
