;;; package --- summary  sql-ide 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package sql-mode
  :mode "\\.sql$"
  :config
  )

;; (use-package sqlformat
;;   :ensure t
;;   :hook (sql-mode . sqlformat-on-save-mode)
;;   :config
;;   (custom-set-default sqlformat-command )
;; )

(use-package sqlup-mode
  :ensure t
  :diminish
  :hook (sql-mode . sqlup-mode)
  :config
)


(provide 'sql-ide)
;;; sql-ide.el ends here
