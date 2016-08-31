;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package helm-gtags
  :ensure t
  ;; :bind-keymap 	("C-c g" . helm-gtags-mode-map)
  :bind (
		 ;; :map helm-gtags-mode-map
		 ;; 	  ("a". helm-gtags-tags-in-this-function)
		 ;; 	  ("A" . helm-gtags-select)
		 ;; 	  ("b" . helm-gtags-pop-stack)
		 ;; 	  ("c" . helm-gtags-clear-stack)
		 ;; 	  ("C" . helm-gtags-clear-all-stacks)
		 ;; 	  ("d" . helm-gtags-display-browser)
		 ;; 	  ("f" . helm-gtags-find-files)
		 ;; 	  ("F" . helm-gtags-parse-file)
		 ;; 	  ("g" . helm-gtags-create-tags)
		 ;; 	  ("h" . helm-gtags-find-tag-from-here)
		 ;; 	  ("n" . helm-gtags-next-history)
		 ;; 	  ("p" . helm-gtags-previous-history)
		 ;; 	  ("P" . helm-gtags-pop-stack)
		 ;; 	  ("r" . helm-gtags-find-rtag)
		 ;; 	  ("R" . helm-gtags-resume)
		 ;; 	  ("s" . helm-gtags-find-symbol)
		 ;; 	  ("S" . helm-gtags-show-stack)
		 ;; 	  ("t" . helm-gtags-find-tag)
		 ;; 	  ("4 t" . helm-gtags-find-tag-other-window)
		 ;; 	  ("u" . helm-gtags-update-tags)
		 ;; 	  ("." . helm-gtags-dwim)
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
