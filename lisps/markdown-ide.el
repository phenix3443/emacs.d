;;; package --- summary  markdown-ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :init
  (setq markdown-command "multimarkdown"))


(use-package markdown-preview-mode
  :ensure t
  :config)

(provide 'markdown-ide)
;;; markdown-ide.el ends here
