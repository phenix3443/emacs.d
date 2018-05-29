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
  :hook (python-mode . yapf-mode)
  :ensure t
  :config
  )

(defun company-python-mode-hook()
  "create python company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-jedi)  (car company-backends)))))

(add-hook 'python-mode-hook 'company-python-mode-hook)

(provide 'python-ide-cfg)
;;; python-ide-cfg.el ends here
