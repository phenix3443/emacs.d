;;; package -- emacs 配置文件
;;; Commentary:
;; -*- coding:utf-8; -*-

;;; code:

(require 'package)
;; (setq package-enable-at-startup nil)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "tsinghua-gnu" (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")) t)
  (add-to-list 'package-archives (cons "tsinghua-melpa" (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")) t)
  (add-to-list 'package-archives (cons "tsinghua-marmalade" (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/marmalade/")) t)
  (add-to-list 'package-archives (cons "tsinghua-org" (concat proto "://mirrors.tuna.tsinghua.edu.cn/elpa/org/")) t)

  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  ;; (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))

(package-initialize)
;; update the package metadata is the local cache is missing
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(add-to-list 'load-path (expand-file-name "lisps" user-emacs-directory))

(require 'misc)

(require 'buildin-cfg)
(require 'aux-utils-cfg)
(require 'theme-cfg)

(require 'editor-cfg)

(require 'common-ide)
(require 'lisp-ide)
(require 'cxx-ide)
(require 'cmake-ide)
(require 'golang-ide)
(require 'lua-ide)


(require 'json-ide)
(require 'ruby-ide)
(require 'python-ide)
(require 'protobuf-ide)
(require 'sql-ide)
(require 'php-ide)
(require 'powershell-ide)
(require 'web-ide)


(require 'crontab-ide)
(require 'markdown-ide)
(require 'docker-ide)
(require 'tex-ide)
(require 'yaml-ide)
(require 'nginx-ide)

(require 'project-cfg)
(require 'vcs-cfg)
(require 'org-cfg)
(require 'github-cfg)
(require 'ssh-cfg)

;; test
;; (use-package misc)

;; (use-package buildin-cfg)
;; (use-package aux-utils-cfg)
;; (use-package theme-cfg)

;; (use-package editor-cfg)

;; (use-package common-ide)
;; (use-package lisp-ide)
;; (use-package cxx-ide)
;; (use-package cmake-ide)
;; (use-package golang-ide)
;; (use-package lua-ide)


;; (use-package json-ide)
;; (use-package ruby-ide)
;; (use-package python-ide)

;; (use-package protobuf-ide)
;; (use-package sql-ide)
;; (use-package php-ide)
;; (use-package powershell-ide)
;; (use-package web-ide)

;; (use-package crontab-ide)
;; (use-package markdown-ide)
;; (use-package docker-ide)
;; (use-package tex-ide)
;; (use-package yaml-ide)
;; (use-package nginx-ide)

;; (use-package project-cfg)
;; (use-package vcs-cfg)
;; (use-package org-cfg)
;; (use-package github-cfg)
;; (use-package ssh-cfg)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
