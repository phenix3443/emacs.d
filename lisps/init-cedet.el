;;; init-cedet.el --- 
;; 
;; Filename: init-cedet.el
;; Description: 
;; Author: phenix<phenix3443@gmail.com>
;; Maintainer: 
;; Created: 二  1月 20 01:48:51 2015 (+0800)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: 三  1月 21 03:21:59 2015 (+0800)
;;           By: phenix
;;     Update #: 5
;; URL: 
;; Doc URL: 
;; Keywords: 
;; Compatibility: 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;; 
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:

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
(require 'semantic/bovine/gcc)
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

(defvar user-include-dirs (list "." "./include" ".." "../include"))
(defvar win-include-dirs (list "C:/MinGW/include" "C:/msys64/usr/include" "C:/Program Files (x86)/Microsoft Visual Studio 11.0/VC/include"))
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

(when (cedet-gnu-global-version-check t)
  (semanticdb-enable-gnu-global-databases 'c-mode t)
  (semanticdb-enable-gnu-global-databases 'c++-mode t)
  (semanticdb-enable-gnu-global-databases 'lua-mode t))

(semantic-mode 1)


;; srecode
;;(add-hook 'prog-mode-hook '(lambda()
;;							 (global-srecode-minor-mode 1)))

(provide 'init-cedet)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cedet.el ends here
