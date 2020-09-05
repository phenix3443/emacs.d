;;; package --- summary  protobuf-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package protobuf-mode
  :ensure t
  :mode ".proto$"
  :hook (protobuf-mode . untabify-buffer)
  :config
  ;; 使用clang-format格式化，不要使用模式自带的格式化功能
  )

(provide 'protobuf-ide)
;;; protobuf-ide.el ends here
