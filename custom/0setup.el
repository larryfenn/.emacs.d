;;; 0setup.el --- Setup general machinery
;;; Commentary:
;;; This initializes all the non-aesthetic components of the Emacs environment.
;;; Code:
;; exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; general
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq select-enable-clipboard t)
(setq system-uses-terminfo nil)
(prefer-coding-system 'utf-8)
(show-paren-mode t)
(require 're-builder)
(setq reb-re-syntax 'string)
(defvar magit-expand-staged-on-commit)
(defvar magit-merge-arguments)
(setq magit-expand-staged-on-commit 'full)
(setq magit-merge-arguments (quote ("--no-ff")))
(add-hook 'magit-mode-hook (lambda () (magit-delta-mode +1)))

;; whitespace handling
(setq-default indent-tabs-mode nil)
(setq-default fill-column 80)
(require 'whitespace)
(setq whitespace-style '(face
                         indentation
                         space-before-tab
                         space-after-tab
                         trailing
                         tabs
                         tab-mark
                         lines-tail))
(global-whitespace-mode 1)
(setq whitespace-global-modes '(not text-mode))

;; flycheck customization
(require 'flycheck)
(flycheck-define-checker proselint
  "A linter for prose."
  :command ("proselint" source-inplace)
  :error-patterns
  ((warning line-start (file-name) ":" line ":" column ": "
        (id (one-or-more (not (any " "))))
        (message) line-end))
  :modes (text-mode markdown-mode gfm-mode))

(add-to-list 'flycheck-checkers 'proselint)

;; eval-after-loads (one-time configs)
;; org mode export backends
(eval-after-load "org"
  '(require 'ox-md nil t))
(eval-after-load "org"
  '(require 'ox-gfm nil t))

;; specific mode hooks (recurring buffer setup)
(add-hook 'prog-mode-hook 'auto-complete-mode)
(add-hook 'prog-mode-hook 'diff-hl-flydiff-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
(add-hook 'text-mode-hook 'visual-line-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'after-init-hook 'turn-on-diff-hl-mode)

;; prevent using filenames in temporary buffers
(let ((file  (or buffer-file-name "DEFAULT-NAME"))))
;;; 0setup.el ends here
