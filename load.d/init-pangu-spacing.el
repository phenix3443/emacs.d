(require 'req-package)
(req-package pangu-spacing
  :config
  (global-pangu-spacing-mode 1)
  (pangu-spacing-modify-buffer)
  )
(provide 'init-pangu-spacing)
