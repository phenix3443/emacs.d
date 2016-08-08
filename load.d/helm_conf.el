;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package helm
  :ensure t
  :bind-keymap ("C-c h" . helm-map)
  :bind (
		 ("M-x"     . helm-M-x)
         ("C-x C-b" . helm-buffer-list)
         ("C-x C-f" . helm-find-files)
		 )
  :config
  (require 'helm-config)

  ;; enable modes
  (helm-mode 1)
  (helm-adaptive-mode 1)

  (helm-projectile-on)

  ;; enable fuzzy matching globally in all functions helmized by helm-mode
  (setq helm-mode-fuzzy-match t)
  (setq helm-completion-in-region-fuzzy-match t)

  (helm-autoresize-mode 1)

  (setq helm-candidate-number-limit 100)

  ;; use locate by regex
  (when (equal system-type 'gnu/linux)
	(setq helm-locate-command "locate %s -e -A --regex %s"))
  ;; helm-locate 使用 es.exe 的时候 everything 必须要启动
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

  (require 'helm-eshell)

  (add-hook 'eshell-mode-hook
			#'(lambda ()
				(define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history)))
  )

(provide 'helm_conf)
