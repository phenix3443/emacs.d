; Time-stamp: <2014-08-27 09:54:15 chengxu70>
; required by program-conf.el
(require 'helm-gtags)
;;; Enable helm-gtags-mode
(add-hook 'prog-mode-hook '(lambda()
							 (helm-gtags-mode 1)))

;; customize
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-auto-update nil))

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
     (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)))

(provide 'init-helm-gtags)
