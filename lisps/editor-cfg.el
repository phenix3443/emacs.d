;;; package --- summary  editor-cfg 配置
;;; -*-coding:utf-8 -*-
;;; commentary:
;;; code:
(use-package paredit
  :ensure t
  :disabled
  :hook (emacs-lisp-mode . enable-paredit-mode)
  :bind(
        :map paredit-mode-map
        ("C-)" . paredit-forward-slurp-sexp) ;向右吞一个表达式
        ("C-(" . paredit-backward-slurp-sexp)
        ("C-}" . paredit-forward-barf-sexp) ;向右吐出表达式
        ("C-{" . paredit-backward-barf-sexp)
        ("C-<right>" . nil)
        ("C-<left>" .  nil)
        )
  :config
  )


(use-package smartparens-config
  :ensure smartparens

  :bind-keymap ("C-c s" . smartparens-mode-map)
  :bind
  (:map smartparens-mode-map
        ("a" . sp-beginning-of-sexp)
        ("e" . sp-end-of-sexp)
        ("f" . sp-forward-sexp)
        ("b" . sp-backward-sexp)
        ("p" . sp-previous-sexp)
        ("u" . sp-up-sexp)
        ("d" . sp-down-sexp)
        ("n" . sp-next-sexp)
        ("k" . sp-kill-sexp)
        ("t" . sp-transpose-sexp)
        ("(" . sp-wrap-round)
        ("[" . sp-wrap-square)
        ("{" . sp-wrap-curly)
        ("<right>". sp-forward-slurp-sexp)
        ("M-<right>" . sp-forward-barf-sexp)
        ("<left>". sp-backward-slurp-sexp)
        ("M-<left>". sp-backward-barf-sexp)
        )
  )


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

(use-package indent-guide
  :ensure t
  :disabled t
  :config
  (setq indent-guide-delay 0.1)
  (indent-guide-global-mode)
  ;; (setq indent-guide-recursive t)
  )

(use-package fill-column-indicator
  :ensure t
  :config
  ;; (add-hook 'prog-mode-hook (lambda () (fci-mode 1)))

  ;; (defun fci-mode-override-advice (&rest args))
  ;; (advice-add 'org-html-fontify-code :around
  ;;          (lambda (fun &rest args)
  ;;            (advice-add 'fci-mode :override #'fci-mode-override-advice)
  ;;            (let ((result  (apply fun args)))
  ;;              (advice-remove 'fci-mode #'fci-mode-override-advice)
  ;;              result)))
  )

(use-package pangu-spacing
  :ensure t
  ;; :disabled t
  :diminish
  :config
  :config
  (global-pangu-spacing-mode 1)
  ;; (setq pangu-spacing-real-insert-separtor t)
  )

(use-package window-numbering
  :ensure t
  :config
  (window-numbering-mode 1)
  )

(use-package helm
  :ensure t
  :diminish
  :init
  (require 'helm-config)
  :bind-keymap ("C-c h" . helm-command-map);
  :config
  ;; 官方默认配置
  (helm-mode 1)
  (define-key global-map [remap find-file] 'helm-find-files)
  (define-key global-map [remap occur] 'helm-occur)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)
  (define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
  (define-key global-map [remap execute-extended-command] 'helm-M-x)
  (unless (boundp 'completion-in-region-function)
    (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
    (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))

  ;; 自定义配置
  (helm-adaptive-mode 1)
  (setq helm-completion-in-region-fuzzy-match t) ;补全使用模糊匹配
  (helm-autoresize-mode 1)
  (setq helm-candidate-number-limit 100)

  ;; helm-locate 使用 es.exe 的时候 everything 必须要启动
  (when (equal system-type 'windows-nt)
    (setq helm-locate-command "es %s -sort run-count %s")
    (defun helm-es-hook ()
      (when (and (equal (assoc-default 'name (helm-get-current-source)) "Locate")
                 (string-match "\\`es" helm-locate-command))
        (mapc (lambda (file)
                (call-process "es" nil nil nil
                              "-inc-run-count" (convert-standard-filename file)))
              (helm-marked-candidates))))
    (add-hook 'helm-find-many-files-after-hook 'helm-es-hook)
    )
  )

(use-package helm-ag
  :after (helm)
  :ensure t
  :config
  )

(use-package htmlize
  :ensure
  :config)

(provide 'editor-cfg)
;;; editor-cfg.el ends here
