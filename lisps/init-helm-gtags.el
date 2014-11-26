;;; Time-stamp: <2014-08-27 09:54:15 chengxu70>
;;; https://https://github.com/syohex/emacs-helm-gtags
;;; required by program-conf.el

(require-package 'helm-gtags)

(require 'helm-gtags)
(add-hook 'prog-mode-hook 'helm-gtags-mode)

(setq helm-gtags-ignore-case t
	  helm-gtags-auto-update t
	  helm-gtags-use-input-at-cursor t
	  helm-gtags-pulse-at-cursor t
	  helm-gtags-prefix-key (kbd "C-c g")
	  helm-gtags-suggested-key-mapping t)

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
	 (global-set-key (kbd "C-c g c") 'helm-gtags-create-tags)
	 (global-set-key (kbd "C-c g t") 'helm-gtags-find-tag)
	 (global-set-key (kbd "C-c g r") 'helm-gtags-find-rtags)
	 (global-set-key (kbd "C-c g .") 'helm-gtags-dwim)
     (global-set-key (kbd "C-c g s") 'helm-gtags-find-symbol)
     (global-set-key (kbd "C-c g f") 'helm-gtags-parse-file)
     (global-set-key (kbd "C-c g p") 'helm-gtags-previous-history)
     (global-set-key (kbd "C-c g n") 'helm-gtags-next-history)
     (global-set-key (kbd "C-c g M-,") 'helm-gtags-pop-stack)
 	 (global-set-key (kbd "C-c g M-.") 'helm-gtags-dwim)))

(provide 'init-helm-gtags)


