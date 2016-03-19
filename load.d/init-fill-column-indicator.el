;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package fill-column-indicator
  :ensure t
  :config
  (require 'fill-column-indicator)
  (add-hook 'prog-mode-hook (lambda () (fci-mode 1)))

  (defun fci-mode-override-advice (&rest args))
  (advice-add 'org-html-fontify-code :around
			  (lambda (fun &rest args)
				(advice-add 'fci-mode :override #'fci-mode-override-advice)
				(let ((result  (apply fun args)))
				  (advice-remove 'fci-mode #'fci-mode-override-advice)
				  result)))
  )
