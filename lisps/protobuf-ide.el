;;; package --- summary  protobuf-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package protobuf-mode
  :ensure t
  :mode ".proto$"
  :config
  (defconst protobuf-style
    '((c-basic-offset . 4)
      (indent-tabs-mode . nil)))

  (add-hook 'protobuf-mode-hook
    (lambda () (c-add-style "my-style" protobuf-style t)))
  )

(provide 'protobuf-ide)
;;; protobuf-ide.el ends here
