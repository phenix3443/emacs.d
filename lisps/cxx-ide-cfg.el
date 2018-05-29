;;; package --- summary c/c++ ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全
(use-package irony
  :ensure t
  :hook c
  :hook c++
  :hook (irony . irony-cdb-autosetup-compile-options)
  :init
  :config
  ;; replace the `completion-at-point' and `complete-symbol' bindings in
  ;; irony-mode's buffers by irony-mode's function
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))

  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  )


(use-package irony-eldoc
  :requires (irony)
  :hook irony
  :ensure t
  :init
  :config
  )


(use-package company-irony
  :requires (company irony)
  :ensure t
  :config
  )

(use-package company-irony-c-headers
  :requires (company)
  :ensure t
  :config)

(use-package company-c-headers
  :requires (company)
  :ensure t
  :config
  ;; (add-to-list company-c-headers-path-user ".")
  ;; (add-to-list company-c-headers-path-system ".")
  )

(defun cquery//enable()
  (condition-case nil
      (lsp-cquery-enable)
    (user-error nil)))

(use-package cquery
  :commands lsp-cquery-enable
  :init (add-hook 'c-mode-common-hook #'cquery//enable)
  :ensure t
  :config
  (setq cquery-executable (concat (getenv "HOME") "/github/cquery/build/release/bin/cquery"))
  )

(defun company-c/c++-mode-setup()
  "C/C++ company补全后端设置"
  (set (make-local-variable 'company-backends)
       (list '(company-irony company-irony-c-headers) (car company-backends))))

(add-hook 'c-mode-hook 'company-c/c++-mode-setup)
(add-hook 'c++-mode-hook 'company-c/c++-mode-setup)

;;; 代码格式化
(use-package clang-format
  :ensure t
  :bind (("C-c i" . clang-format-region)
         ("C-c b" . clang-format-buffer))

  :config
  (setq clang-format-style "google")
  )

(use-package cc-mode
  :ensure t
  :config
  ;; (c-set-offset 'substatement-open 0)
  (setq-default c-basic-offset 4)
  (setq c-default-style '((java-mode . "java")
                          (awk-mode . "awk")
                          (other . "linux")))
  )

(provide 'cxx-ide-cfg)
;;; cxx-ide-cfg.el ends here
