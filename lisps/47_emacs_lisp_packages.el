;; -*- coding:utf-8; -*-

(require 'package)

(add-to-list 'package-directory-list "~/.emacs.d/3rd-party/")

(setq package-enable-at-startup nil)
(setq package-archives '(
	("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
	("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
	("Marmalade" ."http://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")
	("Org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(use-package dash
  :ensure t)

(require 'dash)
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
(provide '47_emacs_lisp_packages)
