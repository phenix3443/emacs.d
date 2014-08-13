; Time-stamp: <2014-08-13 15:44:15 chengxu70>

(require 'org2blog-autoloads)
(require 'netrc)

(setq wp_panghuli (netrc-machine (netrc-parse "~/.emacs.d/.netrc") "wp_panghuli" t))

(setq org2blog/wp-blog-alist
      '(("wp_panghuli"
         :url "http://panghuli.me/xmlrpc.php"
         :username (netrc-get wp_panghuli "login")
         :password (netrc-get wp_panghuli "password")
         :default-title "Hello World"
         :default-categories ("专业知识"))))

;(setq org2blog/wp-buffer-template "")

;`M-x package-install RET htmlize` is required, else you get empty code blocks https://github.com/punchagan/org2blog/blob/master/org2blog.el with wp-use-sourcecode-shortcode set to 't, org2blog will use 1 shortcodes, and hence the SyntaxHighlighter Evolved plugin on your blog. however, if you set this to nil, native Emacs highlighting will be used, implemented as HTML styling. Your pick!

(setq org2blog/wp-use-sourcecode-shortcode 't)
; removed light="true"
(setq org2blog/wp-sourcecode-default-params nil)
; target language needs to be in here
(setq org2blog/wp-sourcecode-langs
      '("actionscript3" "bash" "coldfusion" "cpp" "csharp" "css" "delphi"
        "erlang" "fsharp" "diff" "groovy" "javascript" "java" "javafx" "matlab"
        "objc" "perl" "php" "text" "powershell" "python" "ruby" "scala" "sql"
        "vb" "xml"
        "sh" "emacs-lisp" "lisp" "lua"))
 
; this will use emacs syntax higlighting in your #+BEGIN_SRC <language> <your-code> #+END_SRC code blocks.
(setq org-src-fontify-natively t)

(provide 'init-org2blog)
