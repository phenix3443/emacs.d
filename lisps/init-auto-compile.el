(require 'auto-compile)

(setq load-prefer-newer t)

(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

(setq auto-compile-display-buffer nil)
(setq auto-compile-mode-line-counter t)

(provide 'init-auto-compile)
