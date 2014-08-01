;;Time-stamp: <2014-08-01 21:45:55 chengxu70>
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(set-default 'ac-sources
             '(ac-source-yasnippet
			   ac-source-semantic
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers))

(setq ac-quick-help-delay 1.0)
(setq ac-fuzzy-enable t)

;;copy from emacs wiki
(add-hook 'c-mode-common-hook '(lambda ()
          (add-to-list 'ac-omni-completion-sources
                       (cons "\\." '(ac-source-semantic)))
          (add-to-list 'ac-omni-completion-sources
                       (cons "->" '(ac-source-semantic)))
          (setq ac-sources '(ac-source-semantic ac-source-yasnippet))))

(ac-set-trigger-key "TAB")

(require 'pos-tip)
(setq ac-quick-help-prefer-pos-tip t)

(global-auto-complete-mode t)
(provide 'init-auto-complete)

