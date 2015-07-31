;;;Time-stamp: <2014-08-18 21:08:17 chengxu70>
;;;此文件包含一些琐碎的配置，其中不应包含第三方包的配置

;; 5 Enter Emacs
;(setq inhibit-startup-message t)

;; 6 Exiting Emacs

;; 7.2 change the location of point
(setq track-eol t)

;;22 international character set support
;;(set-language-environment 'utf-8)
;;(cond
;; (is-windows-nt-os (setq default-file-name-coding-system 'chinese-gbk)))

;;42 saving emacs sessions
(desktop-save-mode 1)

(provide 'misc-conf)
