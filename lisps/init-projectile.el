; Time-stamp: <2014-08-14 22:07:02 chengxu70>
(require-package 'projectile)

(require 'projectile)
(projectile-global-mode)
(require 'helm-projectile)
(helm-projectile-on)


;indexing
;(setq projectile-indexing-method 'alien)
;caching
(setq projectile-enable-caching t)
;switching projects
(setq projectile-remember-window-configs t)
(setq projectile-switch-project-action 'helm-projectile-find-file)
;completion
(setq projectile-completion-system 'helm)


;perspective
;(require-package 'perspective)
;(require 'persp-projectile)

;key binding
(setq projectile-keymap-prefix (kbd "C-c p"))

; all project
(define-key projectile-mode-map (kbd "p") 'helm-projectile-switch-project)
(define-key projectile-mode-map (kbd "S-s") 'projectile-save-project-buffers)
(define-key projectile-mode-map (kbd "k") 'projectile-kill-buffers)

; single project
(define-key projectile-mode-map (kbd "S-d") 'projectile-dired)
(define-key projectile-mode-map (kbd "d") 'helm-projectile-find-dir)
(define-key projectile-mode-map (kbd "i") 'projectile-invalidate-cache)

; file
(define-key projectile-mode-map (kbd "b") 'helm-projectile-switch-to-buffer)
(define-key projectile-mode-map (kbd "F") 'helm-projectile-find-file-in-known-projects)
(define-key projectile-mode-map (kbd "f") 'helm-projectile-find-file)
(define-key projectile-mode-map (kbd "l") 'projectile-find-file-in-directory)
(define-key projectile-mode-map (kbd "g") 'projectile-find-file-dwim)
(define-key projectile-mode-map (kbd "a") 'helm-projectile-find-other-file)
(define-key projectile-mode-map (kbd "e") 'helm-projectile-recentf)
(define-key projectile-mode-map (kbd "z") 'projectile-cache-current-file)
(define-key projectile-mode-map (kbd "ESC") 'projectile-project-buffers-other-buffer)

;tags
(define-key projectile-mode-map (kbd "S-r") 'helm-gtags-create-tags)
(define-key projectile-mode-map (kbd "j") 'helm-gtags-find-tag)
(define-key projectile-mode-map (kbd "S-j") 'helm-gtags-find-rtags)
(define-key projectile-mode-map (kbd ".") 'helm-gtags-dwim)
(define-key projectile-mode-map (kbd "I") 'helm-semantic-or-imenu)
;symbol
(define-key projectile-mode-map (kbd "s g") 'helm-projectile-grep)
(define-key projectile-mode-map (kbd "s s") 'helm-projectile-ag)

; file edit
(define-key projectile-mode-map (kbd "r") 'projectile-replace)

; compile
(define-key projectile-mode-map (kbd "c") 'projectile-compile-project)
(define-key projectile-mode-map (kbd "!") 'projectile-run-shell-command-in-root)
(define-key projectile-mode-map (kbd "&") 'projectile-run-async-shell-command-in-root)

; test
(define-key projpectile-mode-map (kbd "t") 'projectile-toggle-between-implementation-and-test)
(define-key projpectile-mode-map (kbd "T") 'projectile-find-test-file)

; document

; version control
(define-key projectile-mode-map (kbd "v") 'helm-projectile-vc)


; run commander in this mode
(define-key projectile-mode-map (kbd "m") 'projectile-commander)

(provide 'init-projectile)
