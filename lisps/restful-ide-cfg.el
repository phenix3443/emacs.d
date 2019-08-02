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
  "Create restclient company backend."
  (setq-local company-backends '(
                                 company-restclient
                                 company-capf
                                 company-dabbrev-code
                                 company-files)))


(provide 'restful-ide-cfg)
;;; restful-ide-cfg.el ends here
