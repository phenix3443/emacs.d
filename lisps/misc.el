;;; package --- summary  一些小的实用的函数，实用纯lisp编写
;;; -*-coding:utf-8 -*-
;;; commentary:

;;; code:

(defun get-package-install-path(package-name)
  "获取包的安装路径"
  (seq-find (lambda (x) (string-match package-name x)) load-path))

(defun load-directory(dir)
  "将目录中的所有文件载入"
  (let (
        (load-it (lambda (f)
                   (load-file (concat (file-name-as-directory dir) f)))))
    (mapc load-it (directory-files dir nil "\\.el$"))))


(provide 'misc)
;;; misc.el ends here
