;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package helm-gtags
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'helm-gtags-mode)

  (custom-set-variables
   '(helm-gtags-parse-file 'root)
   '(helm-gtags-ignore-case t)
   '(helm-gtags-read-only t)
   '(helm-gtags-use-input-at-cursor t)
   '(helm-gtags-highlight-candidate t)
   '(helm-gtags-display-style 'detail)
   '(helm-gtags-auto-update t)
   '(helm-gtags-update-interval-second 60)
   '(helm-gtags-cache-select-result t)
   '(helm-gtags-pulse-at-cursor t)
   '(helm-gtags-fuzzy-match nil)
   '(helm-gtags-direct-helm-completing t)
   '(helm-gtags-prefix-key (kbd "C-c g"))
   )

  ;; key bindings
  (with-eval-after-load "helm-gtags"
	(let ((prefix helm-gtags-prefix-key))
	  (define-key helm-gtags-mode-map (concat prefix "a") 'helm-gtags-tags-in-this-function)
	  (define-key helm-gtags-mode-map (concat prefix "A") 'helm-gtags-select)
	  (define-key helm-gtags-mode-map (concat prefix "b") 'helm-gtags-pop-stack)
	  (define-key helm-gtags-mode-map (concat prefix "c") 'helm-gtags-clear-stack)
	  (define-key helm-gtags-mode-map (concat prefix "C") 'helm-gtags-clear-all-stacks)
	  (define-key helm-gtags-mode-map (concat prefix "d") 'helm-gtags-display-browser)
	  (define-key helm-gtags-mode-map (concat prefix "f") 'helm-gtags-find-files)
	  (define-key helm-gtags-mode-map (concat prefix "F") 'helm-gtags-parse-file)
	  (define-key helm-gtags-mode-map (concat prefix "g") 'helm-gtags-create-tags)
	  (define-key helm-gtags-mode-map (concat prefix "h") 'helm-gtags-find-tag-from-here)
	  (define-key helm-gtags-mode-map (concat prefix "n") 'helm-gtags-next-history)
	  (define-key helm-gtags-mode-map (concat prefix "p") 'helm-gtags-previous-history)
	  (define-key helm-gtags-mode-map (concat prefix "P") 'helm-gtags-pop-stack)
	  (define-key helm-gtags-mode-map (concat prefix "r") 'helm-gtags-find-rtag)
	  (define-key helm-gtags-mode-map (concat prefix "R") 'helm-gtags-resume)
	  (define-key helm-gtags-mode-map (concat prefix "s") 'helm-gtags-find-symbol)
	  (define-key helm-gtags-mode-map (concat prefix "S") 'helm-gtags-show-stack)
	  (define-key helm-gtags-mode-map (concat prefix "t") 'helm-gtags-find-tag)
	  (define-key helm-gtags-mode-map (concat prefix "4 t") 'helm-gtags-find-tag-other-window)
	  (define-key helm-gtags-mode-map (concat prefix "u") 'helm-gtags-update-tags)
	  (define-key helm-gtags-mode-map (concat prefix ".") 'helm-gtags-dwim)
	  ))
  )

(provide 'init-helm-gtags)
