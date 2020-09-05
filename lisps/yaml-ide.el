;;; package --- summary  yaml-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package yaml-mode
  :ensure t
  )

(use-package yaml-imenu
  :ensure t
  :config
  (yaml-imenu-enable)
  )

(provide 'yaml-ide)
;;; yaml-ide.el ends here
