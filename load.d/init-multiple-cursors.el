(require 'req-package)

(req-package multiple-cursors
  :config
  (global-set-key (kbd "C-c m e") 'mc/edit-lines)
  (global-set-key (kbd "C-c m p") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c m n") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c m a") 'mc/mark-all-like-this)
  )
(provide 'init-multiple-cursors)
