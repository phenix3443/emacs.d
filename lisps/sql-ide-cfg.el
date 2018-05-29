;;; package --- summary  sql-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package sql-indent
  :mode "\\.sql$"
  :hook sql
  :ensure t
  :config
  ;; (setq sql-indent-offset 4)
  (setq sql-indent-debug t)
  )


(use-package sqlup-mode
  :ensure t
  :hook (sql sql-interactive)
  :bind (("C-c u" . sqlup-capitalize-keywords-in-region))
  :config
  )

(provide 'sql-ide-cfg)
;;; sql-ide-cfg.el ends here
