; Time-stamp: <2014-08-12 22:43:14 chengxu70>

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						   ("melpa" . "http://melpa.milkbox.net/packages/")
						   ("marmalade" . "http://marmalade-repo.org/packages/"))))

; make sure to have downloaded archive description. Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
						   
(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it is not.Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
      (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

(ensure-package-installed 'auctex
						  'auto-compile
						  'ecb

						  'helm
						  'projectile
						  'helm-gtags
						  'helm-projectile

						  'cdlatex
						  'org

						  'xml-rpc
						  'metaweblog
						  'org2blog

						  'xcscope
						  'yasnippet

;						  'popwin
						  'pos-tip
						  'fuzzy
						  'auto-complete

						  'company

						  'lua-mode
)

; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(provide 'packages-conf)
