;;Time-stamp: <2014-07-14 00:01:55 phenix>
;;;25.2 sentences
(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)


;;;25.10 TeX Mode
(require 'init-auctex)
(require 'init-reftex)
(provide 'init-text)
