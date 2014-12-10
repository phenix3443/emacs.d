;;; Time-stamp: <2014-08-27 09:54:15 chengxu70>
;;; https://https://github.com/syohex/emacs-helm-gtags
;;; required by program-conf.el

(require-package 'helm-gtags)

(setq helm-gtags-ignore-case t
	  helm-gtags-auto-update t
	  helm-gtags-use-input-at-cursor t
	  helm-gtags-pulse-at-cursor t
	  helm-gtags-prefix-key (kbd "C-c g")
	  helm-gtags-suggested-key-mapping t)
(require 'helm-gtags)
(add-hook 'prog-mode-hook 'helm-gtags-mode)

(provide 'init-helm-gtags)


