;;; package --- summary  ruby-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package ruby-mode
  :ensure t
  :mode "\\.rb\\'"
  :interpreter "ruby"
  :hook (ruby-mode . untabify-buffer)
  :config
  )

(provide 'ruby-ide)
;;; ruby-ide.el ends here
