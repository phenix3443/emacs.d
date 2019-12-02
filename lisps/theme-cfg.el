;;; package --- summary 程序外观配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package moe-theme
  :ensure t
  :config
  (load-theme 'moe-dark t)
  )

(use-package diminish
  :ensure t
  :config
  (diminish 'auto-revert-mode)
  (diminish 'visual-line-mode)
  (diminish 'eldoc-mode)
  )


(use-package powerline
  :ensure t
  :disabled
  :config
  (powerline-default-theme)
  )

(use-package smart-mode-line
  :ensure t
  :disabled
  :config
  (setq sml/no-confirm-load-theme t)
  (sml/setup)
  )

(use-package all-the-icons
  :ensure t
  :config
  (when (not (member "all-the-icons" (font-family-list)))
    (all-the-icons-install-fonts t))

  )

(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode)
)

(provide 'theme-cfg)

;;; theme-cfg.el ends here
