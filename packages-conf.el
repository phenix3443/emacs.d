; Time-stamp: <2014-08-14 21:48:18 chengxu70>

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
						   ("melpa" . "http://melpa.milkbox.net/packages/")
						   ("marmalade" . "http://marmalade-repo.org/packages/"))))

; make sure to have downloaded archive description. Or use package-archive-contents as suggested by Nicolas Dudebout
(or (file-exists-p package-user-dir)
    (package-refresh-contents))
(defun require-package (package &optional min-version no-refresh)
  "Ask elpa to install given PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))
						   
(defun ensure-package-installed (&rest packages)
  (mapcar 'require-package packages))

(ensure-package-installed 'auctex
						  'auto-compile
						  'helm
						  
						  ;工程管理
						  'ecb
						  'projectile
						  'helm-projectile
						  'perspective
						  'persp-projectile

						  'cdlatex
						  'org

						  'xml-rpc
						  'metaweblog
						  'htmlize
						  'org2blog
						  
						  ;tags
;						  'xcscope
						  'gtags
						  'helm-gtags
						  
						  ;auto complete
						  'yasnippet
						  
;						  'popwin
						  'pos-tip
						  'fuzzy
						  'auto-complete

						  'company

						  'lua-mode
)

; On-demand installation of packages


(provide 'packages-conf)
