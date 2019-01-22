;;; package --- summary  nginx项目相关配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package nginx-mode
  :ensure t)

(use-package company-nginx
  :ensure t
  :hook (nginx-mode . #'company-nginx-keywords)
  :config
    )

(provide 'nginx-ide)
;;; nginx-ide.el ends here
