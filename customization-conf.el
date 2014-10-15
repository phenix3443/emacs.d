; Time-stamp: <2014-08-08 12:35:24 chengxu70>

;;;48.1.7 custom themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/replace-colorthemes" )
;(load-theme 'wombat t)
(require-package 'color-theme-sanityinc-tomorrow)
(require 'color-theme-sanityinc-tomorrow)
(color-theme-sanityinc-tomorrow--define-theme eighties)

(provide 'customization-conf)
