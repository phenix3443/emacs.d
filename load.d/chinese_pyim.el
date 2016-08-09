;; -*- coding:utf-8; -*-

(require 'use-package)

(use-package chinese-pyim
  :ensure t
  :disabled t
  :config
  (setq pyim-dicts
		'((:name "BigDict" :file "~/.emacs.d/pyim/pyim-bigdict.txt" :coding utf-8-unix)))
  (setq default-input-method "chinese-pyim")
  ;; 让选词框跟随光标
  (setq pyim-use-tooltip t)
  )

(provide 'chinese_pyim)
