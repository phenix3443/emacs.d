;;Time-stamp: <2014-07-11 21:27:03 chengxu70>
(require 'cl)
(defun font-candidate (&rest fonts)
   "Return existing font which first match."
   (find-if (lambda (f) (find-font (font-spec :name f))) fonts))
;; Emacs23 style font setting.
(set-face-attribute 'default nil :font (font-candidate  "DejaVu Sans Mono-12" "Consolas-12"))
(set-frame-font (font-candidate  "DejaVu Sans Mono-12" "Consolas-12"))
(set-fontset-font "fontset-default"
                 'han '("Microsoft YaHei" . "unicode-bmp"))

(provide 'init-fonts)
