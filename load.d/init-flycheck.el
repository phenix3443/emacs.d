(require 'req-package)

(req-package flycheck
  :config
  (add-hook 'prog-mode-hook '(lambda()
							   (flycheck-mode)))
  )
(provide 'init-flycheck)
