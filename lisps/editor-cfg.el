;;; package --- summary  editor-cfg配置
;;; -*-coding:utf-8 -*-
;;; commentary:
;;; code:
(use-package multiple-cursors
  :ensure t
  :bind
  (("C-c m t" . mc/mark-all-like-this)
   ("C-c m m" . mc/mark-all-like-this-dwim)
   ("C-c m l" . mc/edit-lines)
   ("C-c m e" . mc/edit-ends-of-lines)
   ("C-c m a" . mc/edit-beginnings-of-lines)
   ("C-c m n" . mc/mark-next-like-this)
   ("C-c m p" . mc/mark-previous-like-this)
   ("C-c m s" . mc/mark-sgml-tag-pair)
   ("C-c m d" . mc/mark-all-like-this-in-defun))
  :config
  )

(use-package paredit
  :ensure t
  :bind(
        :map paredit-mode-map
             ("C-)" . paredit-forward-slurp-sexp)
             ("C-(" . paredit-backward-slurp-sexp)
             ("C-}" . paredit-forward-barf-sexp)
             ("C-{" . paredit-backward-barf-sexp)
             ("C-<right>" . nil)
             ("C-<left>" .  nil)
             )
  :init
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  :config
  ;; (require-package 'paredit-everywhere)
  ;; (add-hook 'css-mode-hook 'paredit-everywhere-mode)
  )

(use-package pangu-spacing
  :ensure t
  :config
  ;; (setq pangu-spacing-real-insert-separtor t)
  (global-pangu-spacing-mode 1)
  )
(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode 1)
  )

(use-package helm
  :diminish helm-mode
  :ensure t
  :init
  (require 'helm-config)
  :bind-keymap ("C-c h" . helm-command-map);
  :bind
  (
   ("C-x b" . helm-buffers-list)
   ;; ("M-y" . helm-show-kill-ring)
   ("M-x" . helm-M-x)
   ("C-x C-f" . helm-find-files)
   )
  :config
  ;; enable modes
  (helm-mode 1)
  (helm-adaptive-mode 1)
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

  (setq helm-split-window-in-side-p t) ; open helm buffer inside current window, not occupy whole other window
  (setq helm-move-to-line-cycle-in-source t) ; move to end or beginning of source when reaching top or bottom of source.
  (setq helm-ff-search-library-in-sexp t) ; search for library in `require'and `declare-function' sexp.
  (setq helm-scroll-amount 8) ; scroll 8 lines other window using M-<next>/M-<prior>
  (setq helm-ff-file-name-history-use-recentf t)

  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

  (setq helm-apropos-function-list t)

  (add-hook 'eshell-mode-hook
            (lambda ()
              (define-key eshell-mode-map (kbd "C-c C-l")  'helm-eshell-history))))


(use-package helm-ag
  :requires (helm)
  :ensure t
  :config
  )

(provide 'editor-cfg)
;;; editor-cfg.el ends here
