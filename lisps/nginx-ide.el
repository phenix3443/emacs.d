;;; package --- summary  nginx IDE 相关配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package nginx-mode
  :ensure t)

(use-package company-nginx
  :ensure t
  :after (nginx-mode)
  :hook(nginx-mode . company-nginx-keywords)
  :config
  )

(provide 'nginx-ide)
;;; nginx-ide.el ends here
