(require 'req-package)
(req-package helm
  :config
  (require 'helm-config)

  ;; enable modes
  (helm-mode 1)
  (helm-adaptive-mode 1)
  (helm-autoresize-mode 1)

  ;; Fuzzy matching
  (setq helm-recentf-fuzzy-match t
		helm-buffers-fuzzy-matching t
		helm-locate-fuzzy-match nil
		helm-M-x-fuzzy-match t
		helm-semantic-fuzzy-match t
		helm-imenu-fuzzy-match t
		helm-apropos-fuzzy-match t
		helm-lisp-fuzzy-completion t)
  (setq helm-candidate-number-limit 100)

  ;; enable fuzzy matching globally in all functions helmized by helm-mode
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)

  ;; use locate by regex
  (when (equal system-type 'gnu/linux)
	(setq helm-locate-command "locate %s -e -A --regex %s"))
  ;; helm-locate 使用es.exe的时候everything必须要启动
  (when (equal system-type 'windows-nt)
	(let ((str (shell-command-to-string "tasklist /FI \"IMAGENAME eq Everything.exe\"")))
	  (when (not (string-match "Everything.exe" str))
		(when (executable-find "everything")
		  ;; (shell-command "taskkill /IM everything.exe")
		  (start-process "everything" nil "everything" "-admin" "-minimized")))))

  (when (executable-find "curl")
	(setq helm-google-suggest-use-curl-p t))

  (when (executable-find "ack-grep")
	(setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
		  helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))

  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
		helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
		helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
		helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
		helm-ff-file-name-history-use-recentf t)
  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

  (setq helm-apropos-function-list t)

  ;; key binding
  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
  ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
  ;; cannot change `helm-command-prefix-key'once `helm-config' is loaded.
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))
  (define-key helm-map (kbd "M-x") 'helm-M-x)
  (define-key helm-map (kbd "M-y") 'helm-show-kill-ring)
  (define-key helm-map (kbd "C-x C-f") 'helm-find-files)
  (define-key helm-map (kbd "C-h SPC") 'helm-all-mark-rings)
  (define-key helm-map (kbd "C-c h o") 'helm-occur)
  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
  (define-key helm-map (kbd "C-i")  'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

  (require 'helm-eshell)

  (add-hook 'eshell-mode-hook
			#'(lambda ()
				(define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))
  (define-key shell-mode-map (kbd "C-c C-l") 'helm-comint-input-ring)

  )

(provide 'init-helm)
