;; -*- coding:utf-8; -*-

(require 'use-package)
(use-package dash
  :ensure t)

(use-package load-dir
  :ensure nil
  :disabled t
  :init
  (setq force-load-messages t)
  (setq load-dir-debug t)
  (setq load-dir-recursive t)
  (setq load-dirs t)
  :config
  (load-dirs)
 )
(provide 'load-dir-conf)
