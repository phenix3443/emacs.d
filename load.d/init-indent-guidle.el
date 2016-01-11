(require 'req-package)
(req-package indent-guide
  :config
;;; show vertical lines to guide indentation
  (require 'indent-guide)
  (indent-guide-global-mode)
  (setq indent-guide-delay 0.1)
  ;; (setq indent-guide-recursive t)
  )
(provide 'init-indent-guidle)
