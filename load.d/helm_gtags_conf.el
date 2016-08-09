;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package helm-gtags
  :ensure t
  :bind-keymap 	("C-c g" . helm-gtags-mode-map)
  :bind (
		 :map helm-gtags-mode-map
		 	  ("C-c g a". helm-gtags-tags-in-this-function)
		 	  ("C-c g A" . helm-gtags-select)
		 	  ("C-c g b" . helm-gtags-pop-stack)
		 	  ("C-c g c" . helm-gtags-clear-stack)
		 	  ("C-c g C" . helm-gtags-clear-all-stacks)
		 	  ("C-c g d" . helm-gtags-display-browser)
		 	  ("C-c g f" . helm-gtags-find-files)
		 	  ("C-c g F" . helm-gtags-parse-file)
		 	  ("C-c g g" . helm-gtags-create-tags)
		 	  ("C-c g h" . helm-gtags-find-tag-from-here)
		 	  ("C-c g n" . helm-gtags-next-history)
		 	  ("C-c g p" . helm-gtags-previous-history)
		 	  ("C-c g P" . helm-gtags-pop-stack)
		 	  ("C-c g r" . helm-gtags-find-rtag)
		 	  ("C-c g R" . helm-gtags-resume)
		 	  ("C-c g s" . helm-gtags-find-symbol)
		 	  ("C-c g S" . helm-gtags-show-stack)
		 	  ("C-c g t" . helm-gtags-find-tag)
		 	  ("C-c g 4 t" . helm-gtags-find-tag-other-window)
		 	  ("C-c g u" . helm-gtags-update-tags)
			  ("C-c g ." . helm-gtags-dwim)
			  )
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
   )
  )

(provide 'helm_gtags_conf)
