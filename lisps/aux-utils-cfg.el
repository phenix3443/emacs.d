;;; package --- summary  辅助功能设置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package guide-key
  :ensure t
  :config
  (setq guide-key/guide-key-sequence t)

  (setq guide-key/highlight-command-regexp
        '("rectangle"
          ("register" . font-lock-type-face)
          ("bookmark" . "hot pink")))

  (setq guide-key/idle-delay 0.5)
  (setq guide-key/recursive-key-sequence-flag t)
  (setq guide-key/popup-window-position 'bottom)
  (guide-key-mode 1)
  )

;; (use-package which-key
;;   :ensure t)

(use-package helm-descbinds
  :after (helm)
  :ensure t
  :config
  (helm-descbinds-mode))

(use-package restart-emacs
  :ensure t
  :config
  )

(provide 'aux-utils-cfg)
;;; aux-utils-cfg.el ends here
