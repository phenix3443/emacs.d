;; -*- coding:utf-8; -*-

(require 'package)

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

(provide '47_emacs_lisp_packages)
