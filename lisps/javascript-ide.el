;;; package --- summary  javascript-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package js-mode
  ;; :ensure t
  ;; :mode "\\.js$"
  :hook (
         (js-mode . format-all-mode)
         (js-mode . lsp-deferred)
         )
  :config
  )

(provide 'javascript-ide)
;;; javascript-ide.el ends here
