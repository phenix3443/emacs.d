
;; 24.3 Tabs vs Spaces
(setq-default indent-tabs-mode t)

(setq-default tab-width 4)
(setq tab-stop-list (number-sequence 4 120 4))
;; 24.4 Convenience Features for Indentation
(setq tab-always-indent nil)

(provide 'indentation-conf)
