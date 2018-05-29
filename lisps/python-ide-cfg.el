;;; package --- summary python-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package python-mode
  :ensure t
  :disabled t
  :mode ".py$"
  :interpreter "python3"
  :config
  )

(use-package company-jedi
  :requires (company jedi)
  :ensure t
  :config
  (setq jedi:complete-on-dot t)
  )

(use-package yapfify
  :hook python
  :ensure t
  :config
)

(provide 'python-ide-cfg)
;;; python-ide-cfg.el ends here
