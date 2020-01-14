;;; package --- summary java-ide 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全（code complete）

(use-package hydra
  :ensure t
  )

(use-package lsp-java
  :ensure t
  :after lsp
  :hook (java-mode . lsp-deferred)
  :config
  (setq lsp-java-server-install-dir (concat user-emacs-directory "eclipse.jdt.ls"))
  )


(use-package dap-java
  :ensure t
  :after (lsp-java)
  )

;; ;;; Lint, style and syntax checkers

;;; code navigation

;;; compile

;;; run test

;;; Interactive environments

(provide 'java-ide)
;;; java-ide.el ends here
