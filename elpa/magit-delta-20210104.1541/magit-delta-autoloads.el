;;; magit-delta-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "magit-delta" "magit-delta.el" (0 0 0 0))
;;; Generated autoloads from magit-delta.el

(autoload 'magit-delta-mode "magit-delta" "\
Use Delta when displaying diffs in Magit.

If called interactively, enable Magit-Delta mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

https://github.com/dandavison/delta

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "magit-delta" '("magit-delta-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; magit-delta-autoloads.el ends here
