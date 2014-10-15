; Time-stamp: <2014-08-14 23:44:01 phenix>
(require-package 'auto-compile)

(setq load-prefer-newer t)
(require 'auto-compile)
(auto-compile-on-load-mode 1)
(auto-compile-on-save-mode 1)

(setq auto-compile-display-buffer nil)
(setq auto-compile-mode-line-counter t)

(provide 'init-auto-compile)
