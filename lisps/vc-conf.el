;;;版本控制系统配置
(require-package 'magit)

(eval-after-load 'info
  '(progn
	 (info-initialize)
	 (add-to-list 'Info-directory-list (file-name-directory (find-library-name "magit")))))

(provide 'vc-conf)
