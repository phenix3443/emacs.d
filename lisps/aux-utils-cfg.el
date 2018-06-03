;;; package --- summary  辅助功能设置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package guide-key
  :ensure t
  :disabled t
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

(use-package which-key
  ;; 由于 guide-key 与 use-package 中 bind-keymap 兼容性不好
  ;; 加上 which-key 展示更加好看，所以替代 guide-key
  ;; https://github.com/justbur/emacs-which-key
  :ensure t
  :diminish
  :config
  (which-key-mode))

(use-package helm-descbinds
  :after (helm)
  :ensure t
  :config
  (helm-descbinds-mode))

(use-package restart-emacs
  :ensure t
  :config
  )

(use-package google-this
  :ensure t
  :diminish
  :config
  (google-this-mode))

(provide 'aux-utils-cfg)
;;; aux-utils-cfg.el ends here
