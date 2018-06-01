;;; package --- summary  lisp-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package paredit
  :ensure t
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

(defun company-elisp-mode-setup()
  "create lisp company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-elisp) (car company-backends)))))

(add-hook 'emacs-lisp-mode-hook 'company-elisp-mode-setup)

(provide 'lisp-ide-cfg)
;;; lisp-ide-cfg.el ends here
