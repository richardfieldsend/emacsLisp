;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Time-stamp: "2018-02-19 09:55:46 richard"
;;                                  _         _____   __  __
;;   ___ _ __ ___   __ _  ___ ___  | |    __ |_   _|__\ \/ /
;;  / _ \ '_ ` _ \ / _` |/ __/ __| | |   / _` || |/ _ \\  /
;; |  __/ | | | | | (_| | (__\__ \ | |__| (_| || |  __//  \
;;  \___|_| |_| |_|\__,_|\___|___/ |_____\__,_||_|\___/_/\_\
;;
;; emacsLatex: install and configure AuCTeX, the plug-in that makes
;; using LaTeX in Emacs a joy! Also gets reftex (internal references
;; and reference citations) and preview mode set up.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; All things LaTeX and associated.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set load path to include AUCTeX and load it to support LaTeX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Installing from repository.
;;
;; Repository information:
;; origin  https://github.com/jwiegley/auctex.git (fetch)
;; origin  https://github.com/jwiegley/auctex.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepo/auctex")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RefTeX - Turns out that if you are using RefTeX and AuCTeX together
;; then you need the second line below to get the labels suggested.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'reftex)
(setq reftex-plug-into-AUCTeX t)		; Correct Case (that is
										; AUCTeX) is required to make
										; label creation automatic.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Switch on auto-save for LaTeX documents.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq TeX-auto-save t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Switch on electric mode for AucTeX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq TeX-electric-escape t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Added this following a thread on the Emacs subreddit, does some
;; sort of tab completion of macros etc in LaTeX docs.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Make AuCTeX parse the document to find included documents and other
;; goodies.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq TeX-parse-self t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set the master document to nothing. This means for small, one off
;; documents the master document (itself) will be correct when
;; suggested.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default TeX-master nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn on RefTeX for both native LaTeX and AuCTeX versions of the
;; Emacs LaTeX mode.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AucTeX LaTeX mode
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with standard LaTeX mode

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; don't think I need visual line mode (I have fill turned on for
;; LaTeX mode).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'latex-mode-hook 'visual-line-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flyspell on the fly spelling mode.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'flyspell-mode) ; Flyspell for AuCTeX
(add-hook 'latex-mode-hook 'flyspell-mode) ; Flyspell for standard
										; LaTex mode.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Math Mode enabled.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'latex-mode-hook 'LaTeX-math-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Activate word wrap for LaTeX mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Outline-minor-mode whenever visiting a LaTeX file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)
(add-hook 'latex-mode-hook 'outline-minor-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set default bibliography
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq reftex-default-bibliography '("~/bibliography_files/books.bib"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Folding of macros and environments - as described in the manual
;; page here:
;; https://www.gnu.org/software/auctex/manual/auctex/Folding.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook (lambda ()
							 (TeX-fold-mode 1)))

(setq LaTeX-default-author '("Richard Fieldsend"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This works, but requires the menu bar to be turned on so you can
;; select the appropriate command. The results then get displayed in a
;; second buffer.  It seems that if you have a multi-part document the
;; count isn't correct.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; TeXcount setup for TeXcount version 2.3 and later
;;
(defun texcount ()
  (interactive)
  (let*
    ( (this-file (buffer-file-name))
      (enc-str (symbol-name buffer-file-coding-system))
      (enc-opt
        (cond
          ((string-match "utf-8" enc-str) "-utf8")
          ((string-match "latin" enc-str) "-latin1")
          ("-encoding=guess")
      ) )
      (word-count
        (with-output-to-string
          (with-current-buffer standard-output
            (call-process "texcount" nil t nil "-0" enc-opt this-file)
    ) ) ) )
    (message word-count)
) )
(add-hook 'LaTeX-mode-hook (lambda () (define-key LaTeX-mode-map "\C-cw" 'texcount)))
(add-hook 'latex-mode-hook (lambda () (define-key latex-mode-map "\C-cw" 'texcount)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TeXcount setup for AUCTeX
;;
;; Output results of texcount command into another buffer according to
;; this page: http://app.uio.no/ifi/texcount/faq.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'tex)
(add-to-list 'TeX-command-list
      (list "TeXcount" "texcount %s.tex" 'TeX-run-command nil t))
