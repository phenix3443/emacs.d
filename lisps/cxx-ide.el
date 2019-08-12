;;; package --- summary c/c++ ide配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

;;; 代码补全
(use-package ccls
  :ensure t
  ;; :after (lsp-mode lsp-ui-mode company-lsp projectile-mode)
  ;; :after (lsp-mode)
  :config

  ;; (setq lsp-prefer-flymake nil)
  ;; (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))

  ;; ;; Cross reference extensions
  ;; ;; direct callers
  ;; (lsp-find-custom "$ccls/call")
  ;; ;; callers up to 2 levels
  ;; (lsp-find-custom "$ccls/call" '(:levels 2))
  ;; ;; direct callees
  ;; (lsp-find-custom "$ccls/call" '(:callee t))

  ;; (lsp-find-custom "$ccls/vars")

  ;; ;; Use lsp-goto-implementation or lsp-ui-peek-find-implementation (textDocument/implementation) for derived types/functions
  ;; ;; $ccls/inheritance is more general

  ;; ;; Alternatively, use lsp-ui-peek interface
  ;; (lsp-ui-peek-find-custom "$ccls/call")
  ;; (lsp-ui-peek-find-custom "$ccls/call" '(:callee t))

  ;; ;; Recommended helpers:
  ;; (defun ccls/callee () (interactive) (lsp-ui-peek-find-custom "$ccls/call" '(:callee t)))
  ;; (defun ccls/caller () (interactive) (lsp-ui-peek-find-custom "$ccls/call"))
  ;; (defun ccls/vars (kind) (lsp-ui-peek-find-custom "$ccls/vars" `(:kind ,kind)))
  ;; (defun ccls/base (levels) (lsp-ui-peek-find-custom "$ccls/inheritance" `(:levels ,levels)))
  ;; (defun ccls/derived (levels) (lsp-ui-peek-find-custom "$ccls/inheritance" `(:levels ,levels :derived t)))
  ;; (defun ccls/member (kind) (interactive) (lsp-ui-peek-find-custom "$ccls/member" `(:kind ,kind)))

  ;; ;; References w/ Role::Role
  ;; (defun ccls/references-read () (interactive)
  ;;        (lsp-ui-peek-find-custom "textDocument/references"
  ;;                                 (plist-put (lsp--text-document-position-params) :role 8)))

  ;; ;; References w/ Role::Write
  ;; (defun ccls/references-write ()
  ;;   (interactive)
  ;;   (lsp-ui-peek-find-custom "textDocument/references"
  ;;                            (plist-put (lsp--text-document-position-params) :role 16)))

  ;; ;; References w/ Role::Dynamic bit (macro expansions)
  ;; (defun ccls/references-macro () (interactive)
  ;;        (lsp-ui-peek-find-custom "textDocument/references"
  ;;                                 (plist-put (lsp--text-document-position-params) :role 64)))

  ;; ;; References w/o Role::Call bit (e.g. where functions are taken addresses)
  ;; (defun ccls/references-not-call () (interactive)
  ;;        (lsp-ui-peek-find-custom "textDocument/references"
  ;;                                 (plist-put (lsp--text-document-position-params) :excludeRole 32)))

  ;; ;; References whose filenames are under this project
  ;; (lsp-ui-peek-find-references nil (list :folders (vector (projectile-project-root))))

  ;; Semantic highlighting
  (ccls-use-default-rainbow-sem-highlight)
  )

(defun set-company-backends-for-cxx()
  "C/C++ company补全后端设置."
  (setq-local company-backends '(
                                 company-lsp
                                 company-keywords
                                 company-gtags
                                 company-yasnippet
                                 company-capf
                                 company-dabbrev-code
                                 company-files
                                 )))

;;; 代码格式化
(use-package clang-format
  :ensure t
  :hook ((c-mode-common . (lambda ()
                            (add-hook 'before-save-hook 'clang-format-buffer nil t))))
  :commands clang-format-region clang-format-buffer
  :bind (
         ("C-c f i" . clang-format-region)
         ("C-c f b" . clang-format-buffer))

  :config
  ;; (setq clang-format-executable "clang-format")
  ;; (setq clang-format-style-option "google")
)

(use-package cc-mode
  :ensure t
  :hook (
         ((c-mode-common) . set-company-backends-for-cxx)
         ((c-mode-common) . untabify-buffer)
         )
  :config
  (c-toggle-auto-newline 1)
  (setq-default c-basic-offset 4)
  )


(provide 'cxx-ide)
;;; cxx-ide.el ends here
