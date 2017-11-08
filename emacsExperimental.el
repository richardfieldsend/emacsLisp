;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; emacsExperimental.el - initialisation functions testing.
;;
;; Time-stamp: "2017-11-08 17:02:16 richard"
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Time stamp functionality - time stamp in the first 8 lines of the
;; file will automatically update whenever the file is saved. The time
;; stamp needs to be in the format:
;;
;; Time-stamp: " " - angle brackets  < > can be used instead.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-pattern nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remove extra whitespace at the end of the document when saving it.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Accept y/n answers rather than requiring yes/no
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual bell rather than irritating audible bell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq visible-bell t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dynamic abbreviation functionality:
;;
;; Minimise typing in Emacs. This uses two approaches.
;;
;; dabbrev: no need to configure (dynamic abbreviation). To repeat a
;; phrase already typed start typing the new item then type M-/
;; (alt-/) and Emacs will expand with the most recent entry. Repeat
;; the M-/ to go back through the matches.
;;
;; abbreviation mode - add entries to a file which will expand
;; automatically. Abbreviations can be global or mode based.
;;
;; To configure an automatically expanding abbreviation you enter the
;; text you want to expand. Then type C-x a g to trigger the global
;; add. To add multiple worded abbreviations type C-u <no> C-x a g
;; where <no> is the number of words that the abbreviation will expand
;; to. Then type the abbreviated form.
;;
;; To add mode based abbreviations C-x a l.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default abbrev-mode t)
(setq abbrev-file-name "~/emacsLisp/abbrev_defs") ; where
					; abbreviations are stored.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn on global line numbering
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-linum-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn on word wrap for specific modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'text-mode-hook 'auto-fill-mode) ; text mode word wrap
(add-hook 'emacs-lisp-mode-hook 'auto-fill-mode) ; list mode word wrap
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Backing up files each time a file is saved - but crop the number of
;; files  if it gets too high.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq make-backup-files t		; make backups
      backup-by-copying t		; don't clobber files
      version-control t			; number the backups
      delete-old-versions t		; remove excessive files
      kept-old-versions 10		; see link to info about this
      kept-new-versions 2		; https://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Deletion.html
      auto-save-default t		; auto-save buffers
      auto-save-timeout 30		; delay till the save (time in seconds)
      auto-save-interval 100		; delay till the save
					; (keystrokes)
      vc-make-backup-files t		;
      )
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LaTeX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepo/auctex")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use UTF-8 everywhere in Emacs. You know you want to!
;;
;; As outlined on this page:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
   (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Minimap mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/minimap")
(require 'minimap)
