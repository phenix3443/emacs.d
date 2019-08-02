;;; package --- summary  powershell ide 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package powershell
  :ensure t
  :config
  :hook (powershell-mode . untabify-buffer)
  )

(provide 'powershell-ide)
;;; powershell-ide.el ends here
