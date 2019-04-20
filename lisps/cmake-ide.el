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

(defun set-company-backends-for-cmake()
  "Set company backend for cmake."
  (set (make-local-variable 'company-backends)
       (list (append '(company-cmake) (car company-backends)))))

(use-package cmake-mode
  :hook (cmake-mode . set-company-backends-for-cmake)
  )


(provide 'cmake-ide)
;;; cmake-ide.el ends here
