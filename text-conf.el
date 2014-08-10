; Time-stamp: <2014-08-10 21:25:42 phenix>
;; 25.2 sentences
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

;; 25.9 Org mode
(require 'init-org)
(require 'init-org2blog)
;;;25.10 TeX Mode
(require 'init-auctex)
(require 'init-reftex)

(provide 'text-conf)
