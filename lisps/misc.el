;;; package --- summary  一些小的实用的函数，实用纯 lisp 编写
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

(if (eq system-type 'darwin)
  (add-to-list 'exec-path "/usr/local/bin"))

(use-package gist
  :ensure t
  :config
  )

(use-package exec-path-from-shell
  :ensuer t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(provide 'misc)
;;; misc.el ends here
