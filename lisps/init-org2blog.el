;;; init-org2blog.el ---
;;
;; Filename: init-org2blog.el
;; Description:
;; Author: phenix<phenix3443@gmail.com>
;; Maintainer:
;; Created: 六  1月 17 22:47:17 2015 (+0800)
;; Version:
;; Package-Requires: ()
;; Last-Updated: 六  1月 17 22:50:50 2015 (+0800)
;;           By: phenix
;;     Update #: 5
;; URL:
;; Doc URL:
;; Keywords:
;; Compatibility:
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Change Log:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or (at
;; your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Code:

;; (require-package 'netrc)
;; (require-package 'xml-rpc)
;; (require-package 'metaweblog)

(require 'org2blog-autoloads)
(require 'netrc)

;; personal blog site configure


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


(provide 'init-org2blog)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org2blog.el ends here
