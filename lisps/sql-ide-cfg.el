;;; package --- summary  sql-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package sql-indent
  :ensure t
  :mode "\\.sql$"
  :hook sql
  :config
  ;; (setq sql-indent-offset 4)
  (setq sql-indent-debug t)
  )


(use-package sqlup-mode
  :ensure t
  :hook (sql sql-interactive)
  :config
  )

(provide 'sql-ide-cfg)
;;; sql-ide-cfg.el ends here
