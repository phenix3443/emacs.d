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
	 (global-set-key (kbd "C-c p p") 'helm-projectile-switch-project)
	 (global-set-key (kbd "C-c p S-s") 'projectile-save-project-buffers)
	 (global-set-key (kbd "C-c p k") 'projectile-kill-buffers)
	 ;; single project
	 (global-set-key (kbd "C-c p S-d") 'projectile-dired)
	 (global-set-key (kbd "C-c p d") 'helm-projectile-find-dir)
	 (global-set-key (kbd "C-c p i") 'projectile-invalidate-cache)
	 ;; file
	 (global-set-key (kbd "C-c p b") 'helm-projectile-switch-to-buffer)
	 (global-set-key (kbd "C-c p S-f") 'helm-projectile-find-file-in-known-projects)
	 (global-set-key (kbd "C-c p f") 'helm-projectile-find-file)
	 (global-set-key (kbd "C-c p l") 'projectile-find-file-in-directory)
	 (global-set-key (kbd "C-c p g") 'projectile-find-file-dwim)
	 (global-set-key (kbd "C-c p a") 'helm-projectile-find-other-file)
	 (global-set-key (kbd "C-c p e") 'helm-projectile-recentf)
	 (global-set-key (kbd "C-c p z") 'projectile-cache-current-file)
	 (global-set-key (kbd "C-c p ESC") 'projectile-project-buffers-other-buffer)
	 ;;tags
	 (global-set-key (kbd "C-c p S-r") 'helm-gtags-create-tags)
	 (global-set-key (kbd "C-c p j") 'helm-gtags-find-tag)
	 (global-set-key (kbd "C-c p S-j") 'helm-gtags-find-rtags)
	 (global-set-key (kbd "C-c p .") 'helm-gtags-dwim)
	 (global-set-key (kbd "<f8>") 'helm-semantic-or-imenu)
	 ;; symbol
	 (global-set-key (kbd "C-c p s g") 'helm-projectile-grep)
	 (global-set-key (kbd "C-c p s s") 'helm-projectile-ag)
	 ;; file edit
	 (global-set-key (kbd "C-c p r") 'projectile-replace)
	 ;; compile
	 (global-set-key (kbd "C-c p c") 'projectile-compile-project)
	 (global-set-key (kbd "C-c p !") 'projectile-run-shell-command-in-root)
	 (global-set-key (kbd "C-c p &") 'projectile-run-async-shell-command-in-root)
	 ;; test
	 (global-set-key (kbd "C-c p t") 'projectile-toggle-between-implementation-and-test) 
	 (global-set-key (kbd "C-c p T") 'projectile-find-test-file)
	 ;; document
	 ;; version control
	 (global-set-key (kbd "C-c p v") 'helm-projectile-vc)
	 ;; run commander in this mode
	 (global-set-key (kbd "C-c p m") 'projectile-commander)))

(provide 'init-projectile)
