;;; package --- summary  web ide 配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;; 备选的skewer-mode
(use-package  impatient-mode
  :ensure t
  :hook (
         (web-mode . impatient-mode)
         (web-mode . httpd-start)
         )
  :config
  )

(use-package web-mode
  :ensure t
  :mode ("\\.html\\'" . web-mode)
  :config
  )

(use-package company-web
  :ensure t
  :after (company)
  :config)

(use-package rainbow-mode
  :ensure t
  :hook (css-mode . rainbow-mode)
  :config
  )

;; (use-package emmet-mode
;;   :ensure t
;;   :hook ((html-mode css-mode) . emmet-mode)
;;   :config
;;   )

;; (use-package helm-emmet
;;   :ensure t
;;   :after (helm emmet)
;;   :config)

(provide 'web-ide)
;;; web-ide.el ends here
