;;; package --- summary  一些实用的函数
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

;; (load-directory "~/.emacs.d/lisps/") ;load emacs builtin feature



(provide 'misc)
;;; misc.el ends here
