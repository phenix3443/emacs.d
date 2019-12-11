;;; package --- summary macos相关配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:


(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)
    )
  )

(provide 'macos)
;;; macos.el ends here
