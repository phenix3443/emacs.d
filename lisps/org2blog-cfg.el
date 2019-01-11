;;; package --- summary  auto-complete配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(use-package org2blog
  :ensure t
  :config

  (require 'org2blog-autoloads)

  (add-to-list 'auth-sources "~/.netrc")
  (let ((c_1 (auth-source-user-and-password "panghuli_blog"))
        (c_2 (auth-source-user-and-password "blog_local")))
    (setq org2blog/wp-blog-alist
          `(("panghuli_blog"
             :url "http://blog.panghuli.me/xmlrpc.php"
             :username ,(car  c_1)
             :password ,(cadr c_1)
             :default-title ("未命名")
             :default-categories "专业知识")
            ("blog_local"
             :url "http://blog.localhost/xmlrpc.php"
             :username ,(car c_2)
             :password ,(cadr c_2)
             :default-title ("未命名")
             :default-categories "专业知识"))))

  ;; use yasnippet snippet instead of blog template
  ;; (setq org2blog/wp-buffer-template "")


  ;; set wp-use-sourcecode-shortcode to 't, org2blog will use use SyntaxHighlighter Evolved plugin on wordrepss to highlight code block. however, if you set this to nil, native Emacs highlighting will be used, implemented as HTML styling, supported by htmlize.el.
  (setq org2blog/wp-use-sourcecode-shortcode 't)
  ;; default param pass to SyntaxHighlight
  (setq org2blog/wp-sourcecode-default-params "light=\"true\" ")

  ;; do not change this varialbe, default value of this variable mostly as same as syntaxHighlight
  ;; (setq org2blog/wp-sourcecode-langs '())

  ;; add those languages which are not contained in org2blog/wp-source-langs, but supported by org-mode and syntaxhighlight to below variable
  (setq org2blog/wp-shortcode-langs-map
        '(("clojure" . "clojure")
          ("html" . "html")
          ("r" . "r")))

  )

(provide 'org2blog-cfg)
;;; org2blog-cfg.el ends here
