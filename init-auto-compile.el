; Time-stamp: <2014-08-11 17:56:49 chengxu70>

(setq load-prefer-newer t)
(require 'auto-compile)
(auto-compile-on-load-mode 1)
;(auto-compile-on-save-mode 1)

(setq auto-compile-display-buffer nil)
(setq auto-compile-mode-line-counter t)

(provide 'init-auto-compile)
