;;;Time-stamp: <2014-08-14 23:57:25 phenix>

(require-package 'cedet)

(require 'cedet)
(require 'cedet-files)
(require 'cedet-global)
(require 'cedet-idutils)

;; global support
(setq cedet-global-command "global")

;; ede
(setq ede-locate-setup-options '(ede-locate-global 
								ede-locate-base))
;;(add-hook 'prog-mode-hook 'global-ede-mode)

;; semantic configures
(require 'semantic)
(require 'semantic/ia)
;;(require 'semantic-gcc-get-include-paths)
;;(require 'semantic/bovine/gcc)
(require 'semantic/db)

(setq semantic-default-submodes '(global-semanticdb-minor-mode
								  global-semantic-decoration-mode
								  ;;global-semantic-highlight-func-mode
								  global-semantic-idle-local-symbol-highlight-mode
								  global-semantic-idle-scheduler-mode
                                  global-semantic-idle-summary-mode
								  global-semantic-idle-completions-mode
								  ;;global-semantic-mru-bookmark-mode
								  ;;global-semantic-stickyfunc-mode
                                  ))

(defvar user-include-dirs (list "." "./include" ".." "../include" "../../include" "../../../include" "../../../../include"))
(defvar win-include-dirs (list "C:/MinGW/include" "C:/msys64/usr/include" "C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/include"))
(require 'semantic/bovine/c)
(let ((include-dirs user-include-dirs))
  (when (eq system-type 'window-nt)
	(semantic-reset-system-include 'c-mode)
	(semantic-reset-system-include 'c++-mode)
	(setq include-dirs (append include-dirs win-include-dirs)))
  (mapc (lambda (dir)
		  (semantic-add-system-include dir 'c-mode)
		  (semantic-add-system-include dir 'c++-mode))
		include-dirs))

(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode t)
  (semanticdb-enable-gnu-global-databases 'c++-mode t)
  (semanticdb-enable-gnu-global-databases 'lua-mode t))

(semantic-mode 1)


;; srecode
;;(add-hook 'prog-mode-hook '(lambda()
;;							 (global-srecode-minor-mode 1)))

(provide 'init-cedet)