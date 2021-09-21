;;; init.el --- Emacs customization
;;; Commentary:
;;; This is the starting point for all Emacs customization.  This file should
;;; contain only package/dependency management and aesthetic options.
;;; Code:
(setq initial-frame-alist
      '((left . 50)
        (top . 50)
        (width . 180)
        (height . 40)
        ))

(setq default-frame-alist
      '((width . 90)
        (height . 30)
        ))

(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   '("melpa" . "http://melpa.org/packages/")
   t)
  (package-initialize))

;; frame customization
(tool-bar-mode 0)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(display-battery-mode 1)
(require 'time)
(setq display-time-24hr-format t)
(display-time-mode 1)
(require 'sml-modeline)
(sml-modeline-mode 1)
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
(column-number-mode 1)
(line-number-mode 0)
(require 'linum)
(setq linum-format "%4d")
(require 'hlinum)
(hlinum-activate)
(global-linum-mode 1)
(defvar linum-mode-inhibit-modes-list)
(setq linum-mode-inhibit-modes-list '(eshell-mode
                                      shell-mode
                                      erc-mode
                                      jabber-roster-mode
                                      jabber-chat-mode
                                      gnus-group-mode
                                      gnus-article-mode
                                      speedbar-mode
                                      magit-mode
                                      comint-mode
                                      inferior-python-mode
                                      powershell-mode))

;; miscellaneous
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;; cl is deprecated but we want to hide the warning
(setq byte-compile-warnings '(cl-functions))
;; mac only
(setq mac-command-modifier 'meta)

(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font-12.0"))

(add-to-list 'load-path "~/.emacs.d/custom")
(load "0setup.elc")
(load "1python.elc")
(load "3r.elc")
(load "4web.elc")
(load "5tex.elc")
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"])
 '(ansi-term-color-vector
   [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"])
 '(custom-enabled-themes '(sanityinc-tomorrow-bright))
 '(custom-safe-themes
   '("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default))
 '(package-selected-packages
   '(hlinum web-mode sml-modeline robe restclient rainbow-mode ox-gfm markdown-mode magit-popup magit launchctl julia-mode jedi fold-this flycheck-pos-tip exec-path-from-shell ess enh-ruby-mode diff-hl csv-mode color-theme-sanityinc-tomorrow async uniquify-files magit-delta xterm-colors)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
