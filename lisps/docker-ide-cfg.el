;;; package --- summary  docker-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package docker-compose-mode
  :ensure t)


(use-package dockerfile-mode
  :ensure t
  :mode "Dockerfile\\'"
  :config)

(provide 'docker-ide-cfg)
;;; docker-ide-cfg.el ends here
