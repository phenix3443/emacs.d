;;; init-cedet.el ---
;;
;; Filename: init-cedet.el
;; Description:
;; Author: phenix<phenix3443@gmail.com>
;; Maintainer:
;; Created: 二  1月 20 01:48:51 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated: 周六 二月  7 18:04:18 2015 (+0800)
;;           By: chengxu70
;;     Update #: 27
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

;; (setq load-path (remove-if (lambda (x) (string-match-p "cedet" x)) load-path))

(load-file "~/.emacs.d/3rd-party/cedet/cedet-devel-load.el")
(add-to-list'load-path "~/.emacs.d/3rd-party/cedet/contrib")

;; load contrib library
(require'eassist)

;; ede
(setq ede-locate-setup-options '(ede-locate-global ede-locate-base))
(global-ede-mode t)
(setq ede-project-placeholder-cache-file "~/.emacs.d/tmp-dir/ede-projects.el")

;; configure from semantic manual

;; 2.1 Semantic mode
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
;; 2.2.1 Semanticdb Tag Storage
(setq semantic-default-save-directory "~/.emacs.d/tmp-dir/semanticdb/")

;; global support
(setq cedet-global-command "global")
(semanticdb-enable-gnu-global-databases'c-mode t)
(semanticdb-enable-gnu-global-databases'c++-mode t)

;; 2.2.2.2 SemanticDB project roots
(defun get-semantic-project-root()
  (let((semantic-projct-root-markers . '(".git" ".svn" "GTAGS" "TAGS")))
	))
(add-hook 'semanticdb-project-root-functions 'projectile-project-root)

;; 2.2.2.3 Include Paths
(defvar user-include-dirs (list "." "./include" ".." "../include" "/opt/lixian/include" "/opt/lixian/include/appframe/"))
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

(semantic-mode 1)

(provide 'init-cedet)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-cedet.el ends here
