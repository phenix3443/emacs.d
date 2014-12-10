;;; Time-stamp: <2014-08-27 09:54:15 chengxu70>
;;; https://https://github.com/syohex/emacs-helm-gtags
;;; required by program-conf.el

(require-package 'helm-gtags)

(add-hook 'prog-mode-hook 'helm-gtags-mode)

(custom-set-variables
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update t)
 '(helm-gtags-use-input-at-cursor t)
 '(helm-gtags-pulse-at-cursor t)
 '(helm-gtags-prefix-key "C-c g")
 '(helm-gtags-suggested-key-mapping t))

;; key bindings
(eval-after-load "helm-gtags"
'(progn
  (let ((prefix helm-gtags-prefix-key))
    (define-key helm-gtags-mode-map (concat prefix "h") 'helm-gtags-display-browser)
    (define-key helm-gtags-mode-map "\C-]" 'helm-gtags-find-tag-from-here)
    (define-key helm-gtags-mode-map "\C-t" 'helm-gtags-pop-stack)
    (define-key helm-gtags-mode-map (concat prefix "P") 'helm-gtags-find-files)
    (define-key helm-gtags-mode-map (concat prefix "f") 'helm-gtags-parse-file)
    (define-key helm-gtags-mode-map (concat prefix "g") 'helm-gtags-find-pattern)
    (define-key helm-gtags-mode-map (concat prefix "s") 'helm-gtags-find-symbol)
    (define-key helm-gtags-mode-map (concat prefix "r") 'helm-gtags-find-rtag)
    (define-key helm-gtags-mode-map (concat prefix "d") 'helm-gtags-find-tag)
	(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
    ;; common
    (define-key helm-gtags-mode-map "\e*" 'helm-gtags-pop-stack)
    (define-key helm-gtags-mode-map "\e." 'helm-gtags-find-tag)
    (define-key helm-gtags-mode-map "\C-x4." 'helm-gtags-find-tag-other-window))))
(require 'helm-gtags)


(provide 'init-helm-gtags)


