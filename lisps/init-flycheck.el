
(require 'flycheck)

(add-hook 'prog-mode-hook '(lambda()
							 (flycheck-mode)))
(provide 'init-flycheck)
