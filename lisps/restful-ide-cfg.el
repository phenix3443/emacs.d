;;; package --- summary  restful-ide-cfg配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package restclient
  :ensure t
  :config)

(use-package company-restclient
  :requires (company restclient)
  :ensure t)

(defun company-cmake-mode-setup()
  "create restclient company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-restclient) (car company-backends)))))

(provide 'restful-ide-cfg)
;;; restful-ide-cfg.el ends here
