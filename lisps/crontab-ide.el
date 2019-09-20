;;; package --- summary  crontab-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package crontab-mode
  :ensure t
  :mode
  ("\\.cron\\(tab\\)?\\'" . crontab-mode)
  :hook (crontab-mode . untabify-buffer)
  :config
  )


(provide 'crontab-ide)
;;; crontab-ide.el ends here
