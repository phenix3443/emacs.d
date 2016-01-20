;; -*- coding:utf-8; -*-

(require 'package)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

;; gnutls connect failure
;; https://github.com/nicferrier/elmarmalade/issues/55
;; (if (fboundp 'gnutls-available-p)
;;     (fmakunbound 'gnutls-available-p))
;; (setq tls-program '("gnutls-cli --tofu -p %p %h")
;;       imap-ssl-program '("gnutls-cli --tofu -p %p %s")
;;       smtpmail-stream-type 'starttls
;;       starttls-extra-arguments '("--tofu")
;;       )

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
			 '("popkit" . "http://elpa.popkit.org/packages/"))

(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(setq package-enable-at-startup nil)

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

(defun require-package (package &optional min-version no-refresh)
  "refresh package archives, check package presence and install if it's not installed"
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;; 加载 elpa 包的配置
(defun init-elpa-packages ()
  "load elpa packages"
  (require-package 'req-package)
  (require'req-package)

  ;; load.d
  (random t)

  (req-package-force load-dir
	:defer 1
	:init
	(setq force-load-messages nil)
	(setq load-dir-debug t)
	(setq load-dir-recursive t)
	(setq load-dirs t)
	:config
	(load-dirs)
	(req-package-finish)
	)
  )

(add-hook 'after-init-hook 'init-elpa-packages)

(add-to-list 'package-directory-list "~/.emacs.d/3rd-party/")

(package-initialize)

(provide 'packages-conf)
