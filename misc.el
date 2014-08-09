; Time-stamp: <2014-08-09 15:49:16 chengxu70>


; 5 Enter Emacs
(setq inhibit-startup-message t)
; 6 Exiting Emacs

;; 7.2 change the location of point
(setq track-eol t)

;; 22 international character set support
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

; 42 saving emacs sessions
(desktop-save-mode 1)

(provide 'misc)
