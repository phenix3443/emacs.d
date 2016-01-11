(require 'req-package)
(req-package guide-key
  :config
  (setq guide-key/guide-key-sequence '("C-x r"
									   "C-x 4"
									   "C-c p" ;projectile
									   "C-c p s"
									   "C-c h" ;helm
									   "C-c g" ;gtags
									   "C-c C-e"))
  ;; (setq guide-key/recursive-key-sequence-flag t)
  (setq guide-key/highlight-command-regexp
		'("rectangle"
		  ("register" . font-lock-type-face)
		  ("bookmark" . "hot pink")))
  (setq guide-key/idle-delay 0.1)
  (guide-key-mode 1)
  (setq guide-key/popup-window-position 'bottom)
  )
(provide 'init-guide-key)
