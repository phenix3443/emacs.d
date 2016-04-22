;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package auto-complete
  :ensure t
  ;; :disabled t
  :config
  ;; 3.2 install script
  (require 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default)

  ;; 6.2 Builtin Sources
  (setq-default ac-sources
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

  (add-hook 'prog-mode-hook (lambda ()
							  (append '(ac-source-gtags
										ac-source-semantic
										ac-source-semantic-raw)
									  ac-sources)))
  (add-hook 'emacs-lisp-mode-hook (lambda ()
									(append '(ac-source-features
											  ac-source-functions
											  ac-source-symbols
											  ac-source-variables)
											ac-sources)))

  (add-hook 'css-mode-hook (lambda ()
							 (append '(ac-source-css-property) ac-sources)))


  ;; 7.16 Show a lastly completed candidate help
  (define-key ac-mode-map (kbd "C-c c h") 'ac-last-quick-help)
  (define-key ac-mode-map (kbd "C-c c H") 'ac-last-help)

  ;; 9 Configuration
  ;; 9.1 Delay time to start completion in real number seconds
  (setq ac-delay 0.3)
  ;; 9.2 Show completion menu automatically
  (setq ac-auto-show-menu 0.8)
  ;; 9.3 show completion menu immediately on auto-complete command
  (setq ac-show-menu-immediately-on-auto-complete t)
  ;; 9.4 expand a common part of whole candidates
  (setq ac-expand-on-auto-complete t)

  ;; 9.6 stop Flymake on completion
  (setq ac-stop-flymake-on-completing t)
  ;; 9.7 use fuzzy matching
  (setq ac-use-fuzzy t)
  ;; 9.9 use candidate suggestion
  (setq ac-comphist t)
  ;; 9.11 ac-comphist-file
  (setq ac-comphist-file "~/.emacs.d/auto-complete/ac-comphist.dat")
  ;; 9.12. use quick help
  (setq ac-use-quick-help t)
  ;; 9.13 Delay time to show quick help in real number seconds.
  (setq ac-quick-help-delay 3.0)
  ;; 9.14 ac-menu-height
  ;;(setq ac-menu-height 20)
  ;; 9.16 ac-quick-help-prefer-pos-tip
  (use-package pos-tip
	:ensure t
	:config
	(when (equal system-type 'windows-nt)
	  (setq pos-tip-w32-saved-max-width-height t)))

  (setq ac-quick-help-prefer-pos-tip t)

  ;; 9.24 ac-auto-start
  (setq ac-auto-start 2)

  ;; 9.27 ac-ignore-case
  (setq ac-ignore-case 'smart)
  ;; 9.28 ac-dwim
  (setq ac-dwim t)
  ;; 9.29 ac-use-menu-map
  (setq ac-use-menu-map t)

  ;; 9.35 ac-user-dictionary
  (add-to-list 'ac-user-dictionary
			   "~/.emacs.d/auto-complete/")
  ;; 9.36 ac-user-dictionary-files
  (add-to-list 'ac-user-dictionary-files
			   "~/.emacs.d/auto-complete/user.dict")
  ;; 9.37 ac-dictionary-directories
  (add-to-list 'ac-dictionary-directories
			   "~/.emacs.d/auto-complete/")

  ;; 9.34 global-auto-complete-mode
  (global-auto-complete-mode t)

  ;; 一些辅助的库
  ;; (use-package ac-html
  ;; 	:ensure t
  ;; 	:config
  ;; 	(add-hook 'html-mode-hook 'ac-html-enable)

	;; (add-to-list 'web-mode-ac-sources-alist
	;; '("html" . (
	;; attribute-value better to be first
	;; ac-source-html-attribute-value
	;; ac-source-html-tag
	;; ac-source-html-attribute)))
	;; )

  (use-package auto-complete-c-headers
	:ensure t
	;; :disabled t
	:config
	(require 'auto-complete-c-headers)
	(add-to-list 'ac-sources 'ac-source-c-headers)
	)

  (use-package auto-complete-clang
	:ensure t
	;; :disabled t
	:config
	(defun my-ac-cc-mode-setup ()
	  (setq ac-sources (append '(ac-source-clang) ac-sources)))
	(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
	)

  (use-package auto-complete-exuberant-ctags
	:ensure t
	;; :disabled t
	:config
	(ac-exuberant-ctags-setup)
	)

  )



(provide 'init-auto-complete)
