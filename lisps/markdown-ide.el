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

(use-package markdown-toc
  :ensure t)

;; 实时展示
;; https://github.com/shime/emacs-livedown
(use-package livedown
  :init
  (custom-set-variables
   '(livedown-autostart nil) ; automatically open preview when opening markdown files
   '(livedown-open t)        ; automatically open the browser window
   '(livedown-port 1337)     ; port for livedown server
   '(livedown-browser nil))  ; browser to use
  )

(provide 'markdown-ide)
;;; markdown-ide.el ends here
