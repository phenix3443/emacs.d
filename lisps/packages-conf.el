;; -*- coding:utf-8; -*-

(require 'package)


(add-to-list 'package-directory-list "~/.emacs.d/3rd-party/")

(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(add-to-list 'package-archives
			 '("marmalade" . "http://marmalade-repo.org/packages/"))

;(add-to-list 'package-archives
;			 '("popkit" . "http://elpa.popkit.org/packages/"))

;;(add-to-list 'package-archives
;;             '("elpy" . "https://jorgenschaefer.github.io/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(use-package load-dir
  :ensure t
  :init
  (setq force-load-messages t)
  (setq load-dir-debug t)
  (setq load-dir-recursive t)
  (setq load-dirs t)
  :config
  (load-dirs)
 )
(provide 'packages-conf)
