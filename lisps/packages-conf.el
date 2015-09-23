;;; packages-conf.el ---
;;
;; Filename: packages-conf.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer: phenix3443
;; Created: 周三 二月  4 18:42:43 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated: 周一 9月 21 00:30:00 2015 (+0800)
;;           By: phenix
;;     Update #: 11
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
(require 'package)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)

; make sure to have downloaded archive description. Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))


(defun load-package-init-files()
  "load most packages init files"
  (require 'init-helm)
  (require 'init-multiple-cursors)
  (require 'init-window-numbering)
  (require 'init-chinese-pyim)
  (require 'init-indent-guidle)
  (require 'init-auctex)
  (require 'init-org)
  (require 'init-org2blog)
  (require 'init-pangu-spacing)
  (require 'init-paredit)
  (require 'init-smartparens)
  (require 'init-yasnippet)
  ;; auto-complete configure
  ;; (require 'init-popwin)
  ;; (require 'init-company)
  (require 'init-auto-complete)
  (require 'init-flycheck)
  ;;project support
  (require 'init-projectile)
  (require 'init-cedet)
  (require 'init-helm-gtags)
  (require 'init-lua-mode)
  (require 'init-markdown-mode)
  (require 'init-auto-compile)
  (require 'init-header2)
  (require 'init-themes)
  (require 'init-guide-key)
  )
(add-hook 'after-init-hook 'load-package-init-files)

(provide 'packages-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; packages-conf.el ends here
