;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package paredit
  :ensure t
  :config

  (autoload 'enable-paredit-mode "paredit" t)

  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

  (with-eval-after-load 'paredit
	(define-key paredit-mode-map (kbd "C-)") 'paredit-forward-slurp-sexp)
	(define-key paredit-mode-map (kbd "C-(") 'paredit-backward-slurp-sexp)
	(define-key paredit-mode-map (kbd "C-}") 'paredit-forward-barf-sexp)
	(define-key paredit-mode-map (kbd "C-{") 'paredit-backward-barf-sexp)
	(define-key paredit-mode-map (kbd "C-<right>") nil)
	(define-key paredit-mode-map (kbd "C-<left>")  nil))

  ;; (require-package 'paredit-everywhere)
  ;; (add-hook 'prog-mode-hook 'paredit-everywhere-mode)
  ;; (add-hook 'css-mode-hook 'paredit-everywhere-mode)
  )
(provide 'init-paredit)
