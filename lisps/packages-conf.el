;;; packages-conf.el ---
;;
;; Filename: packages-conf.el
;; Description:
;; Author: phenix3443 <phenix3443@gmail.com>
;; Maintainer: phenix3443 <phenix3443@gmail.com>
;; Created: 周三 二月  4 18:42:43 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated: 周一 11月  2 16:52:30 2015 (+0800)
;;           By: phenix
;;     Update #: 25
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

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; gnutls connect failure
;; https://github.com/nicferrier/elmarmalade/issues/55
;; (if (fboundp 'gnutls-available-p)
;;     (fmakunbound 'gnutls-available-p))
;; (setq tls-program '("gnutls-cli --tofu -p %p %h")
;;       imap-ssl-program '("gnutls-cli --tofu -p %p %s")
;;       smtpmail-stream-type 'starttls
;;       starttls-extra-arguments '("--tofu")
;;       )

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
			 '("popkit" . "http://elpa.popkit.org/packages/"))

(setq package-enable-at-startup nil)

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(defun require-package (package &optional min-version no-refresh)
  "refresh package archives, check package presence and install if it's not installed"
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(require-package 'auctex)
(require-package 'auto-compile)
(require-package 'auto-complete)
(require-package 'chinese-pyim)
;; (require-package 'company)
(require-package 'csharp-mode)
(require-package 'cdlatex)
(require-package 'ecb)
(require-package 'flycheck)
;; (require-package 'ggtags)
(require-package 'guide-key)
(require-package 'header2)
(require-package 'helm)
(require-package 'helm-ag)
(require-package 'helm-gtags)
(require-package 'htmlize)
(require-package 'indent-guide)
(require-package 'lua-mode)
(require-package 'magit)
(require-package 'markdown-mode)
(require-package 'multiple-cursors)
(require-package 'org)
(require-package 'org2blog)
(require-package 'pangu-spacing)
(require-package 'paredit)
(require-package 'perspective)
(require-package 'persp-projectile)
(require-package 'popwin)
(require-package 'projectile)
(require-package 'protobuf-mode)
(require-package 'session)
(require-package 'smartparens)
(require-package 'color-theme-sanityinc-tomorrow)
(require-package 'use-package)
(require-package 'window-numbering)
(require-package 'yasnippet)

;; 加载elpa包的配置
(defun init-elpa-packages ()
  "load most packages init files"
  ;; (require 'init-auctex)
  (require 'init-auto-compile)
  (require 'init-auto-complete)
  ;; (require 'init-chinese-pyim)
  ;; (require 'init-company)
  (require 'init-csharp-mode)
  ;;(require 'init-ecb)
  ;; (require 'init-flycheck)
  ;; (require 'init-ggtags)
  (require 'init-guide-key)
  ;; (require 'init-header2)
  (require 'init-helm)
  (require 'init-helm-gtags)
  (require 'init-iimage)
  (require 'init-indent-guidle)
  (require 'init-lua-mode)
  (require 'init-magit)
  (require 'init-markdown-mode)
  (require 'init-multiple-cursors)
  (require 'init-org)
  (require 'init-org2blog)
  (require 'init-org-page)
  (require 'init-pangu-spacing)
  (require 'init-paredit)
  (require 'init-perspective)
  (require 'init-popwin)  ;; auto-complete configure
  (require 'init-projectile);;project support
  (require 'init-protobuf-mode)
  (require 'init-session)
  (require 'init-smartparens)
  (require 'init-themes)
  (require 'init-use-package)
  (require 'init-window-numbering)
  (require 'init-yasnippet)

  )
(add-hook 'after-init-hook 'init-elpa-packages)

(add-to-list 'package-directory-list "~/.emacs.d/3rd-party/")

(package-initialize)

(provide 'packages-conf)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; packages-conf.el ends here
