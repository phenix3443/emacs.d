;; Time-stamp: <2014-08-14 22:07:02 chengxu70>
(require-package 'projectile)

(require 'projectile)
;; (projectile-global-mode)
(add-hook 'prog-mode 'projectile-mode)

(eval-after-load "projectile"
  '(progn
	 (require 'helm-projectile)
	 (helm-projectile-on)

	 ;; indexing
	 ;;(setq projectile-indexing-method 'alien)
	 ;; caching
	 (setq projectile-enable-caching t)
	 ;; switching projects
	 (setq projectile-remember-window-configs t)
	 (setq projectile-switch-project-action 'helm-projectile-find-file)
	 ;; completion
	 (setq projectile-completion-system 'helm)


	 ;;perspective
	 ;;(require-package 'perspective)
	 ;;(require 'persp-projectile)

	 ;;key binding
	 (setq projectile-keymap-prefix (kbd "C-c p"))
	 ;; all project
	 (define-key projectile-mode-map (kbd "M-p") 'helm-projectile-switch-project)
	 (define-key projectile-mode-map (kbd "M-S-s") 'projectile-save-project-buffers)
	 (define-key projectile-mode-map (kbd "M-k") 'projectile-kill-buffers)
	 ;; single project
	 (define-key projectile-mode-map (kbd "M-S-d") 'projectile-dired)
	 (define-key projectile-mode-map (kbd "M-d") 'helm-projectile-find-dir)
	 (define-key projectile-mode-map (kbd "M-i") 'projectile-invalidate-cache)
	 ;; file
	 (define-key projectile-mode-map (kbd "M-b") 'helm-projectile-switch-to-buffer)
	 (define-key projectile-mode-map (kbd "M-S-f") 'helm-projectile-find-file-in-known-projects)
	 (define-key projectile-mode-map (kbd "M-f") 'helm-projectile-find-file)
	 (define-key projectile-mode-map (kbd "M-l") 'projectile-find-file-in-directory)
	 (define-key projectile-mode-map (kbd "M-g") 'projectile-find-file-dwim)
	 (define-key projectile-mode-map (kbd "M-a") 'helm-projectile-find-other-file)
	 (define-key projectile-mode-map (kbd "M-e") 'helm-projectile-recentf)
	 (define-key projectile-mode-map (kbd "M-z") 'projectile-cache-current-file)
	 (define-key projectile-mode-map (kbd "M-ESC") 'projectile-project-buffers-other-buffer)
	 ;;tags
	 (define-key projectile-mode-map (kbd "M-S-r") 'helm-gtags-create-tags)
	 (define-key projectile-mode-map (kbd "M-j") 'helm-gtags-find-tag)
	 (define-key projectile-mode-map (kbd "M-S-j") 'helm-gtags-find-rtags)
	 (define-key projectile-mode-map (kbd "M-.") 'helm-gtags-dwim)
	 (define-key projectile-mode-map (kbd "M-I") 'helm-semantic-or-imenu)
	 ;; symbol
	 (define-key projectile-mode-map (kbd "M-s g") 'helm-projectile-grep)
	 (define-key projectile-mode-map (kbd "M-s s") 'helm-projectile-ag)
	 ;; file edit
	 (define-key projectile-mode-map (kbd "M-r") 'projectile-replace)
	 ;; compile
	 (define-key projectile-mode-map (kbd "M-c") 'projectile-compile-project)
	 (define-key projectile-mode-map (kbd "M-!") 'projectile-run-shell-command-in-root)
	 (define-key projectile-mode-map (kbd "M-&") 'projectile-run-async-shell-command-in-root)
	 ;; test
	 (define-key projectile-mode-map (kbd "M-t") 'projectile-toggle-between-implementation-and-test) 
	 (define-key projectile-mode-map (kbd "M-T") 'projectile-find-test-file)
	 ;; document
	 ;; version control
	 (define-key projectile-mode-map (kbd "M-v") 'helm-projectile-vc)
	 ;; run commander in this mode
	 (define-key projectile-mode-map (kbd "M-m") 'projectile-commander)))

(provide 'init-projectile)
