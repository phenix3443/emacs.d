(require 'req-package)
(req-package pangu-spacing
  :config
  (setq pangu-spacing-real-insert-separtor t)
  (global-pangu-spacing-mode 1)
  )
(provide 'init-pangu-spacing)
