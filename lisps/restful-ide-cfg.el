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

(provide 'restful-ide-cfg)
;;; restful-ide-cfg.el ends here
