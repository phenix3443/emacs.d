;;Time-stamp: <2014-07-11 21:28:00 chengxu70>
;;cedet

(load-file "~/.emacs.d/cedet-1.1/common/cedet.elc")

;;ede
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
	"../.." "../../include" "../../inc" "../../common" "../../public"))



(global-ede-mode 1)
(global-semantic-highlight-edits-mode (if window-system 1 -1))
(global-semantic-show-unmatched-syntax-mode 1)
(global-semantic-show-parser-state-mode 1)

;;semantic

(setq semantic-default-submodes '(global-semanticdb-minor-mode
				  global-semantic-idle-scheduler-mode
                                  global-semantic-idle-summary-mode
				  global-semantic-idle-completions-mode
				  global-semantic-decoration-mode
				  global-semantic-highlight-func-mode
				  global-semantic-stickyfunc-mode
                                  global-semantic-mru-bookmark-mode))


(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when is_windows_nt_os
    (setq include-dirs (append include-dirs sys-include-dirs)))
  (mapc (lambda (dir)
	  (semantic-add-system-include dir 'c++-mode)
	  (semantic-add-system-include dir 'c-mode))
	include-dirs))

(global-set-key [f12] 'semantic-ia-fast-jump)

(defun semantic-ia-fast-jump-back ()
  (interactive)
  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
      (error "Semantic Bookmark ring is currently empty"))
  (let* ((ring (oref semantic-mru-bookmark-ring ring))
         (alist (semantic-mrub-ring-to-assoc-list ring))
         (first (cdr (car alist))))
    (if (semantic-equivalent-tag-p (oref first tag) (semantic-current-tag))
        (setq first (cdr (car (cdr alist)))))
    (semantic-mrub-switch-tags first)))

(global-set-key [S-f12] 'semantic-ia-fast-jump-back)

(define-key c-mode-base-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)

(require 'eassist nil 'noerror)
(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))
(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)

(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))


(require 'semantic-tag-folding nil 'noerror)
(global-semantic-tag-folding-mode 1)

(global-srecode-minor-mode 1)
(provide 'init_cedet)

