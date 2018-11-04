;;; package --- summary  emacs ide公共配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:


(use-package cmake-mode
  :ensure t
  :mode
  ("CMakeLists\\.txt\\'" . cmake-mode)
  ("\\.cmake\\'" . cmake-mode)
  :config
  )

(use-package company-cmake
  :after (company)
  :config
  )

(defun company-cmake-mode-setup()
  "create cmake company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-cmake) (car company-backends)))))

(add-hook 'cmake-mode-hook 'company-cmake-mode-setup)

(provide 'cmake-ide)
;;; cmake-ide.el ends here
