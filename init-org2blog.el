; Time-stamp: <2014-08-27 10:12:10 chengxu70>
; required by text-conf.el

(require-package 'org2blog)
(require-package 'netrc)
(require-package 'xml-rpc)
(require-package 'metaweblog)

(require 'org2blog-autoloads)
(require 'netrc)

(setq panghuli_blog (netrc-machine (netrc-parse "~/.netrc") "panghuli_blog" t))

;personal blog site configure
(setq org2blog/wp-blog-alist
      '(("panghuli_blog"
         :url "http://blog.panghuli.me/xmlrpc.php"
         :username (netrc-get panghuli_blog "login")
         :password (netrc-get panghuli_blog "password")
		 :default-title ("未命名")
         :default-categories "专业知识"
		 )))

; use yasnippet snippet instead of blog template
;(setq org2blog/wp-buffer-template "")

; this will use emacs syntax higlighting in your #+BEGIN_SRC <language> <your-code> #+END_SRC code blocks.
(setq org-src-fontify-natively t)
;set wp-use-sourcecode-shortcode to 't, org2blog will use use SyntaxHighlighter Evolved plugin on wordrepss to highlight code block. however, if you set this to nil, native Emacs highlighting will be used, implemented as HTML styling, supported by htmlize.el.
(setq org2blog/wp-use-sourcecode-shortcode 't)
;default param pass to SyntaxHighlight
(setq org2blog/wp-sourcecode-default-params "light=\"true\" ")

;do not change this varialbe, default value of this variable mostly as same as syntaxHighlight
;(setq org2blog/wp-sourcecode-langs '()) 

; add those languages which are not contained in org2blog/wp-source-langs, but supported by org-mode and syntaxhighlight to below variable
(setq org2blog/wp-shortcode-langs-map 
	  '(("clojure" . "clojure")
		("html" . "html")
		("r" . "r")))


(provide 'init-org2blog)
