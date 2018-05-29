;;; package --- summary  lisp-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package paredit
  :disabled
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

(defun company-elisp-mode-setup()
  "create lisp company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-elisp) (car company-backends)))))

(add-hook 'emacs-lisp-mode-hook 'company-elisp-mode-setup)

(provide 'lisp-ide-cfg)
;;; lisp-ide-cfg.el ends here
