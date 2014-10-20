; Time-stamp: <2014-08-27 10:12:10 chengxu70>
; required by text-conf.el

(require-package 'org2blog)
(require-package 'netrc)
(require-package 'xml-rpc)
(require-package 'metaweblog)

(require 'org2blog-autoloads)
(require 'netrc)

(setq panghuli_blog (netrc-machine (netrc-parse "~/.emacs.d/.netrc") "panghuli_blog" t))

(setq org2blog/wp-blog-alist
      '(("panghuli_blog"
         :url "http://blog.panghuli.me/xmlrpc.php"
         :username (netrc-get panghuli_blog "login")
         :password (netrc-get panghuli_blog "password")
         :default-categories ("专业知识"))))

;(setq org2blog/wp-buffer-template "")

;`M-x package-install RET htmlize` is required, else you get empty code blocks https://github.com/punchagan/org2blog/blob/master/org2blog.el with wp-use-sourcecode-shortcode set to 't, org2blog will use 1 shortcodes, and hence the SyntaxHighlighter Evolved plugin on your blog. however, if you set this to nil, native Emacs highlighting will be used, implemented as HTML styling. Your pick!

(setq org2blog/wp-use-sourcecode-shortcode 't)
; removed light="true"
(setq org2blog/wp-sourcecode-default-params nil)
; target language needs to be in here
(setq org2blog/wp-sourcecode-langs
      '("actionscript3"
		"bash"
		"c" "c++" "coldfusion"  "cpp" "csharp" "css"
		"delphi"
        "elisp" "erlang"
		"fsharp"
		"go"
		"html"
		"java" "javascript"
		"lisp" "lua"
		"matlab"
        "objc"
		"perl"  "php" "powershell" "python"
		"ruby" 
		"sh" "shell" "sql"
		"text"   
        "vb" 
		"xml"))
 
; this will use emacs syntax higlighting in your #+BEGIN_SRC <language> <your-code> #+END_SRC code blocks.
(setq org-src-fontify-natively t)

(provide 'init-org2blog)
