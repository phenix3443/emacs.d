;;; package --- summary  json-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package json-mode
  :ensure t
  :mode "\\.json$"
  :hook (json-mode . format-all-mode)
  :config)

(provide 'json-ide)
;;; json-ide.el ends here
