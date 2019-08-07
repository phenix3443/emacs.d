;;; package --- summary  org-cfg配置
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:
(use-package org
  :ensure t
  :hook (
         (org-mode . turn-on-org-cdlatex)
         (org-mode . (lambda ()
                             (setq-local pangu-spacing-real-insert-separtor t)))
         )
  :init

  :config
  (require 'ox-md nil t)
  ;; 3 Tables
  (setq org-ascii-table-keep-all-vertical-lines t)
  ;; 3.2 Column width and alignment
  (setq org-startup-align-all-tables t)
  ;; 4.4 Handling links
  (setq org-file-apps '((auto-mode . emacs)
                        ("\\.mm\\'" . default)
                        ("\\.x?html?\\'" . default)
                        ("\\.pdf\\'" . "okular %s")
                        ))

  ;; Markup for rich export
  ;; 11.7 Embedded LaTeX
  ;; 11.7.2 Subscripts and superscripts（上标和下标）
  ;; (setq org-use-sub-superscripts '{})
  (setq org-export-with-sub-superscripts '{})
  ;; 12 Exporting
  ;; 12.3 Export setting
  ;; (setq org-export-with-section-numbers 3)
  ;; 12.6 HTML export
  (setq org-html-validation-link nil)
  ;; 12.6.2 HTML doctypes
  ;; (setq org-html-doctype "html4-transitional")
  ;; 12.6.6 Tables
  (setq org-html-table-default-attributes '(:border "1" :cellspacing "0" :cellpadding "6" :rules "groups" :frame "hsides" :width "auto"))

  ;; 12.6.12 JavaScript supported display of web pages
  ;; (setq org-html-infojs-options '((path . "../scripts/org-info.js")
  ;;                                (view . "showall")
  ;;                                (toc . :with-toc)
  ;;                                (ftoc . "0")
  ;;                                (tdepth . "max")
  ;;                                (sdepth . "max")
  ;;                                (mouse . "underline")
  ;;                                (buttons . "0")
  ;;                                (ltoc . "1")
  ;;                                (up . :html-link-up)
  ;;                                (home . :html-link-home)))

  ;; 12.7 LaTeX and PDF export
  (require 'ox-latex)
  (add-hook'org-mode-hook
   (lambda ()
     (setq org-latex-default-packages-alist
           (delete'("AUTO" "inputenc" t) org-latex-default-packages-alist))))

  (add-to-list 'org-latex-packages-alist '("" "xeCJK" t))
  (add-to-list 'org-latex-packages-alist '("" "listings" t))
  (add-to-list 'org-latex-packages-alist '("" "color" t))
  ;; 12.7.2 LaTeX specific export settings
  (setq org-latex-pdf-process
        '("xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"
          "xelatex -interaction nonstopmode -output-directory %o %f"))

  ;; 12.7.3 Header and sectioning structure
  ;; 设置 article header
  (setcar (cdr (assoc "article" org-latex-classes))
          "\\documentclass[12pt,a4paper]{article} \\usepackage[margin=2cm]{geometry} \\usepackage{fontspec} \\usepackage[slantfont,boldfont,CJKnumber,CJKtextspaces]{xeCJK} \\setCJKmainfont{AR PL UKai CN} \\setmainfont{DejaVu Serif} \\setmonofont{DejaVu Sans Mono} \\setsansfont{DejaVu Sans} \\usepackage[colorlinks,linkcolor=blue,anchorcolor=red,citecolor=green,urlcolor=blue]{hyperref}")
  (when (equal system-type 'windows-nt)
    (setcar (cdr (assoc "article" org-latex-classes))
            "\\documentclass[12pt,a4paper]{ctexart}"))

  ;; 13 Publishing
  (require 'ox-publish)
  ;; 13.1 Configuration
  ;; 13.1.1 The variable org-publish-project-alist
  (setq org-publish-project-alist
        '(
          ("notebook-html"
           ;; 13.1.2 Sources and destinations for files
           :base-directory "~/gitlab/notebook/" ;设置存放.org 文件位置
           :publishing-directory "~/github/notebook/docs/" ;导出 html 文件位置
           ;; :preparation-function
           ;; :completion-function ;用来定义publish结束以后的动作，该项目中用于执行push master

           ;; 13.1.3 Selecting files
           :base-extension "org"            ;仅处理.org 格式文件
           :exclude "*~"
           ;; :include
           :recursive t

           ;; 13.1.4 Publishing action
           :publishing-function org-html-publish-to-html
           :htmlized-source t

           ;; 13.1.5 Options for the exporters
           :headline-levels 4
           :with-author
           :with-date
           :with-email
           :with-sub-superscript
           ;; html export properties
           :html-extension "html"
           :html-head "<script type=\"text/javascript\" src=\"./script/org-info.js\">"
           :html-link-home "https://phenix3443.github.io/"
           :html-use-infojs t

           ;; 13.1.7 Generating a sitemap
           :auto-sitemap t
           :sitemap-filename "index.html"
           :sitemap-title "notebook"
           ;; 13.1.8 Generating an index
           ;; :makeindex t
           )

          ("notebook-static"
           :base-directory "~/github/notebook/"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
           :publishing-directory "~/github/notebook/docs/"
           :recursive t
           :publishing-function org-publish-attachment
           )
          ("notebook" :components ("notebook-html" "notebook-static"))))

  ;; 13.4 Triggering publication
  (setq org-publish-use-timestamps-flag nil)

  (when (equal system-type 'windows-nt)
    (setq org-plist (cdr (assoc "org" org-publish-project-alist)))
    (plist-put org-plist :base-directory "D:/gitlab/org-notes/")
    (plist-put org-plist :publishing-directory "D:/github/phenix3443.github.io/")

    (setq static-plist (cdr (assoc "static" org-publish-project-alist)))
    (plist-put static-plist :base-directory "D:/github/org-notes/org/")
    (plist-put static-plist :publishing-directory "D:/github/phenix3443.github.io/"))

  ;; (setq org-babel-default-header-args
  ;;       (cons '(:base-directory "D:/projects/org-notes/org/")
  ;; (assq-delete-all org org-publish-project-alist)
  ;; )))

  ;; 14 Working with source code
  ;; 14.2 Editing source code
  (setq org-edit-src-auto-save-idle-delay 5)
  ;; (setq org-edit-src-turn-on-auto-save t)
  (add-to-list 'org-src-lang-modes '("lua" . lua))
  (setq org-src-window-setup 'current-window)
  (setq org-src-preserve-indentation t)
  (setq org-edit-src-content-indentation 0)
  (setq org-src-ask-before-returning-to-edit-buffer nil)
  (setq org-src-fontify-natively t)

  ;; 14.3 Exporting code blocks
  ;; (setq org-export-babel-evaluate 'inline)
  ;; 14.4 Extracting source code
  ;; 14.5 Evaluating code blocks
  ;; (setq org-babel-inline-result-wrap "%s")
  ;; 14.7 Languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (awk . t)
     (C . t)
     ;; (C++ . t)
     (css . t)
     (dot . t)
     (emacs-lisp . t)
     (js . t)
     ;; (lua . t)
     (makefile . t)
     (plantuml . t)
     (python . t)
     ;; (powershell . t)
     (R . t)
     (ruby . t)
     (shell . t)
     ))


  ;; 14.8 Header arguments
  ;; 14.8.1 Using header arguments
  (setq org-babel-default-header-args
        (append '((:padline . "true")(:comments . "yes")(:mkdirp . "yes"))  org-babel-default-header-args))

  ;; (setq org-babel-default-header-args
  ;;      (cons '(:tangle . "yes")
  ;;            (assq-delete-all :tangle org-babel-default-header-args)))

  ;; 15 Miscellaneous
  ;; 15.4 Code evaluation and security issues
  (setq org-confirm-babel-evaluate nil)

  ;; 15.8 A cleaner outline view
  (setq org-startup-folded nil)
  ;; (setq org-startup-indented t)
  ;; (setq org-startup-with-inline-images t)
  (setq org-startup-with-latex-preview t)
  ;; (setq org-list-indent-offset 2)

  (setq org-plantuml-jar-path
        (expand-file-name "plantuml.jar" user-emacs-directory))

  (setq org-babel-python-command "python3")
  )

(provide 'org-cfg)
;;; org-cfg.el ends here
