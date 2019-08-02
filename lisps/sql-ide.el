;;; package --- summary  sql-ide 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package sql-mode
  :mode "\\.sql$"
  :hook (sql-mode . untabify-buffer)
  :config
  )

(use-package sql-indent
  :ensure t
  :config
)

(use-package sqlformat
  :ensure t
  :hook (sql-mode . sqlformat-on-save-mode)
  :config
  (setq sqlformat-command 'pgformatter)
)


(use-package sqlup-mode
  :ensure t
  :diminish
  :hook (sql-mode . sqlup-mode)
  :config
)


(provide 'sql-ide)
;;; sql-ide.el ends here
