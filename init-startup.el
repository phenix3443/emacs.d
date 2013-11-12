;;hide the welcome screen in Emacs

(defconst is_gnu_os (equal system-type 'gnu) "GNU Hurd system")
(defconst is_gnu_linux_os (equal system-type 'gnu/linux) "GNU/Linux system")
(defconst is_gnu_kfreebsd_os (equal system-type 'gnu/kfreebsd) "GNU system with a FreeBSD kernel")
(defconst is_darwin_os (equal system-type 'darwin) "Darwin")
(defconst is_ms_dos_os (equal system-type 'ms-dos) "MS-DOS system")
(defconst is_windows_nt_os (equal system-type 'windows-nt) "native win32 application")
(defconst is_cygwin_os (equal system-type 'cygwin) "cygwin")

(cond (is_gnu_os ())
      (is_gnu_linux_os ())
      (is_gnu_kfreebsd_os ())
      (is_darwin_os())
      (is_ms_dos_os ())
      (is_windows_nt_os())
      (cygmin-os ()))

(setq inhibit-startup-message t)

;;color theme
(load-theme 'wombat t)

;;frame
(setq frame-title-format (list "Emacs " emacs-version))
(tool-bar-mode -1)

;;mode line
(display-time-mode 1)
(setq display-time-format "%D %a %H:%M")

(provide 'init-startup)
