;;; package --- summary  lisp-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(defun set-company-backends-for-elisp()
  "Create Lisp company backend."
  (setq-local company-backends
              '(
                company-elisp
                company-yasnippet
                company-capf
                company-files
                company-keywords
                )))

(use-package emacs-lisp-mode
  :hook (
         (emacs-lisp-mode . set-company-backends-for-elisp)
         (emacs-lisp-mode . format-all-mode)
         )
  )

(provide 'lisp-ide)
;;; lisp-ide.el ends here
