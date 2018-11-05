;;; package --- summary  markdown-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . markdown-mode))
  )

;; 实时展示
(use-package livedown
  :load-path "/data/github/emacs-livedown/"
  :init
  (custom-set-variables
   '(livedown-autostart nil) ; automatically open preview when opening markdown files
   '(livedown-open t)        ; automatically open the browser window
   '(livedown-port 1337)     ; port for livedown server
   '(livedown-browser nil))  ; browser to use
  )

(provide 'markdown-ide)
;;; markdown-ide.el ends here
