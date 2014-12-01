;; Time-stamp: <2014-08-27 09:51:11 chengxu70>
;; required by program-conf.el

(require-package 'yasnippet)

(require 'yasnippet)
(yas-global-mode 1)
;; Remove Yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Set Yasnippet's key binding to shift+tab
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
(provide 'init-yasnippet)
