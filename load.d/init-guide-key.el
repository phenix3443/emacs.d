(require 'req-package)
(req-package guide-key
  :config
  (setq guide-key/guide-key-sequence
		'("C-x r"
		  "C-x 4"
		  ;; gtags
		  "C-c g"
		  ;; helm
		  "C-c h"
		  "C-c h C-c"
		  "C-c h C-x"
		  "C-c h h"
		  "C-c h M-s"
		  "C-c h M-g"
		  ;; projectile
		  "C-c p"
		  "C-c p s"

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
