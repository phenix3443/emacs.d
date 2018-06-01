;;; package --- summary python-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全（code complete）
(use-package company-jedi
  ;; sudo pip3 install jedi
  :ensure t
  :after (company)
  :config
  (setq jedi:complete-on-dot t)
  )

(defun company-python-mode-hook()
  "create python company backend"
  (set (make-local-variable 'company-backends)
       (list (append '(company-jedi)  (car company-backends)))))

(add-hook 'python-mode-hook 'company-python-mode-hook)


;;; 编辑辅助(Code generation helpers)

;;; Lint, style and syntax checkers
(use-package yapfify
  ;; 需要安装 sudo pip3 install yapf
  :ensure t
  :hook (python-mode . yapf-mode)
  :config
  )

;;; code navigation

;;; compile

;;; run test
;;; Interactive environments
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i")

(provide 'python-ide-cfg)
;;; python-ide-cfg.el ends here
