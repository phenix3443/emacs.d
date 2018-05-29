;;; package --- summary  emacs ide公共配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:


(use-package cmake-mode
  :mode
  ("CMakeLists\\.txt\\'" . cmake-mode)
  ("\\.cmake\\'" . cmake-mode)
  :ensure t
  :config
  )
