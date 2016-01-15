(require 'req-package)

(req-package fill-column-indicator
  :config
  (require 'fill-column-indicator)
  (add-hook 'prog-mode-hook (lambda () (fci-mode 1)))
  )
