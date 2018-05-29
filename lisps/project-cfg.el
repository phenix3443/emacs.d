;;; package --- summary  project配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package helm-gtags
  :ensure t
  :after (helm)
  :hook (prog-mode . helm-gtags-mode)
  :bind (:map helm-gtags-mode-map
              ("C-c g a" . helm-gtags-tags-in-this-function)
              ("C-c g b" . helm-gtags-display-browser)
              ("C-c g c" . helm-gtags-clear-cache)
              ("C-c g d" . helm-gtags-clear-all-cache)
              ("C-c g f" . helm-gtags-find-files)
              ("C-c g g" . helm-gtags-create-tags)
              ("C-c g u" . helm-gtags-update-tags)
              ("C-c g j" . helm-gtags-select)
              ("C-c g p" . helm-gtags-pop-stack)
              ("C-c g q" . helm-gtags-clear-stack)
              ("C-c g Q" . helm-gtags-clear-all-stacks)
              ("C-c g s" . helm-gtags-find-symbol)
              ("C-c g r" . helm-gtags-find-rtag)
              ("C-c g t" . helm-gtags-find-tag)
              ("C-c g ," . helm-gtags-find-tag-from-here)
              ("C-c g T" . helm-gtags-find-tag-other-window)
              ("C-c g R" . helm-gtags-resume)
              ("C-c g P" . helm-gtags-parse-file)
              ("C-c g S" . helm-gtags-find-pattern)
              ("C-c g ." . helm-gtags-dwim)
              ("C-c g <" . helm-gtags-previous-history)
              ("C-c g >" . helm-gtags-next-history)
              )

  :config
  (custom-set-variables
   '(helm-gtags-auto-update t)
   '(helm-gtags-cache-select-result nil)
   '(helm-gtags-direct-helm-completing t)
   '(helm-gtags-display-style 'detail)
   '(helm-gtags-fuzzy-match nil)
   '(helm-gtags-highlight-candidate t)
   ;; '(helm-gtags-ignore-case t)
   '(helm-gtags-parse-file 'root)
   '(helm-gtags-path-style 'root)
   '(helm-gtags-pulse-at-cursor t)
   '(helm-gtags-read-only nil)
   '(helm-gtags-update-interval-second 30)
   '(helm-gtags-use-input-at-cursor t)
   )
  )


(use-package projectile
  :ensure t
  :config
  (projectile-mode)

  (if (equal system-type 'windows-nt)
      (progn
        (setq projectile-indexing-method 'alien)
        (setq projectile-enable-caching t)
        ))
  )

(use-package helm-projectile
  :after (helm projectile)
  :ensure t
  :config
  (helm-projectile-on)
  ;; switching projects
  (setq projectile-switch-project-action 'helm-projectile)
  ;; completion
  (setq projectile-completion-system 'helm)
  )

;; (use-package persp-mode
;;   :ensure t
;;   :config
;;   (persp-mode 1)
;;   )
(use-package sr-speedbar
  :ensure t
  :config
  )


(use-package graphviz-dot-mode
  :ensure t
  :config)

(provide 'project-cfg)

;;; project-cfg.el ends here
