;;; package --- summary  lisp-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(defun company-elisp-mode-setup()
  "create lisp company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-elisp) (car company-backends)))))

(add-hook 'emacs-lisp-mode-hook 'company-elisp-mode-setup)

(provide 'lisp-ide-cfg)
;;; lisp-ide-cfg.el ends here
