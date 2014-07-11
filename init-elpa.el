;;elpa configures
;;------------------------------------------------------------------------------
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						   ("melpa" . "http://melpa.milkbox.net/packages/")
						   ("marmalade" . "http://marmalade-repo.org/packages/"))))
						   
;;------------------------------------------------------------------------------
;; On-demand installation of packages
;;------------------------------------------------------------------------------
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(require-package 'auto-complete)
(require-package 'fuzzy)
(require-package 'lua-mode)
(require-package 'popwin)
(require-package 'pos-tip)
(require-package 'yasnippet)

(provide 'init-elpa)
