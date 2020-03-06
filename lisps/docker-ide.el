;;; package --- summary  docker-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package docker-compose-mode
  :ensure t)


(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'"
  :hook (
         (dockerfile-mode . format-all-mode)
         (dockerfile-mode. lsp-deferred)
         )
  :config)

(provide 'docker-ide)
;;; docker-ide.el ends here
