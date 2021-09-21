;; todo:
;; reinstall auctex separately
;; correctly use custom TEMPLATE
;; fix binaries

(add-hook 'TeX-mode-hook 'visual-line-mode)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
;; AucTeX: helpful error messages
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))

;; LaTeX mode hooks- things i do with latex that i want to have
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
(add-hook 'LaTeX-mode-hook (lambda ()
  (push
    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
      :help "Run latexmk on file")
    TeX-command-list)))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))


(defvar reftex-plug-into-AUCTeX)
(setq reftex-plug-into-AUCTeX t)
(setq-default TeX-PDF-mode t)


;; use Sumatra as default pdf viewer
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-view-program-list
'(("Sumatra PDF" ("\"~/win/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
   (mode-io-correlate " -forward-search %b %n ") " %o"))))

(eval-after-load 'tex
 '(progn
   (assq-delete-all 'output-pdf TeX-view-program-selection)
   (add-to-list 'TeX-view-program-selection '(output-pdf "Sumatra PDF"))))
