; Time-stamp: <2014-08-13 01:42:54 phenix> 
(require-package 'xcscope)

(require 'xcscope)
(cscope-setup)

(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-history-forward-line)
(define-key global-map [(control f10)] 'cscope-history-forward-file)
(define-key global-map [(control f11)] 'cscope-history-backward-line)
(define-key global-map [(control f12)] 'cscope-history-backward-file)
(define-key global-map [(meta f9)]  'cscope-display-buffer)


(provide 'init-xcscope)
