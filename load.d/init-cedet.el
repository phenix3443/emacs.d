;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package cedet
  :load-path "3rd-party/cedet/"
  :init
  (setq byte-compile-warnings nil)
  (load-file "~/.emacs.d/3rd-party/cedet/cedet-devel-load.el")
  :config
  ;
  ;; ede
  ;; (require 'ede)
  ;; (setq ede-locate-setup-options '(ede-locate-global ede-locate-base))
  ;; (global-ede-mode t)
  ;; (setq ede-project-placeholder-cache-file
  ;; 		"~/.emacs.d/tmp-dir/ede-projects.el")

  ;; configure from semantic manual

  ;; 2.1 Semantic mode
  (setq semantic-default-submodes
  		'(global-semanticdb-minor-mode
  		  global-semantic-decoration-mode
  		  ;;global-semantic-highlight-func-mode
  		  ;; global-semantic-idle-local-symbol-highlight-mode
  		  global-semantic-idle-scheduler-mode
  		  global-semantic-idle-summary-mode
  		  global-semantic-idle-completions-mode
  		  ;;global-semantic-mru-bookmark-mode
  		  ;;global-semantic-stickyfunc-mode
  		  ))
  ;; 2.2.1 Semanticdb Tag Storage
  (setq semantic-default-save-directory
  		"~/.emacs.d/tmp-dir/semanticdb/")

  ;; global support

  (setq cedet-global-command "global")
  (when(cedet-gnu-global-version-check t)
  	(semanticdb-enable-gnu-global-databases 'c-mode t)
  	(semanticdb-enable-gnu-global-databases 'c++-mode t))

  ;; 2.2.2.2 SemanticDB project roots
  (defun get-semantic-project-root()
  	(let((semantic-projct-root-markers . '(".git" ".svn" "GTAGS" "TAGS")))
  	  ))
  (add-hook 'semanticdb-project-root-functions 'projectile-project-root)

  ;; 2.2.2.3 Include Paths
  (defvar user-include-dirs
  	(list "." "./include" ".." "../include" "/opt/lixian/include" "/opt/lixian/include/appframe/"))
  (defvar win-include-dirs
  	(list "C:/MinGW/include" "C:/msys64/usr/include" "C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/include"))
  (require 'semantic/bovine/c)

  (let ((include-dirs user-include-dirs))
  	(when (eq system-type 'window-nt)
  	  (semantic-reset-system-include 'c-mode)
  	  (semantic-reset-system-include 'c++-mode)
  	  (append include-dirs win-include-dirs))
  	(mapc (lambda (dir)
  			(semantic-add-system-include dir 'c-mode)
  			(semantic-add-system-include dir 'c++-mode))
  		  include-dirs))

  (semantic-mode 1)

  ;; Do not install ECB before you have successfully installed the requirements!
  ;(use-package ecb
	;:disabled t
	;:ensure t
	;)
  )

(provide 'init-cedet)
