(require 'req-package)
(req-package chinese-pyim
  :config
  (setq pyim-dicts '((:name "BigDict" :file "~/.emacs.d/pyim/pyim-bigdict.txt" :coding utf-8-unix)))
  (setq default-input-method "chinese-pyim")
  ;; 让选词框跟随光标
  (setq pyim-use-tooltip t)
  )

(provide 'init-chinese-pyim)
