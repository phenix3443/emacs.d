(require 'req-package)
(req-package iimage
  :config
  (setq iimage-mode-image-search-path '(list "." "./img"))
  ;; (add-hook 'text-mode-hook 'iimage-mode)
  )
(provide 'init-iimage)
