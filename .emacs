;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Emacs Initialisation from scratch.
;;
;; Time-stamp: "2017-12-21 20:49:55 rf343"
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set the location for initialisation files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsLisp/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Split out Emacs Initialisation Files for various purposes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "emacsVersionControl")		; Magit setup
(load "emacsAppearance")		; Appearance setup
(load "emacsFileHandling")		; File handling setup
(load "emacsProgramming")		; Programming settings
(load "emacsWriting")			; writing stuff
(load "emacsLatex")				; LaTeX stuff
(load "emacsOrgMode")			; OrgMode stuff

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add Emacs Experimental Functionality.
;;
;; Content in this file should be moved into suitable sub-files as
;; they prove their worth.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "emacsExperimental")		; Experimental initialisation
					; functions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bbdb-file "~/Dropbox/bbdb")
 '(ebib-autogenerate-keys t)
 '(ebib-bib-search-dirs (quote ("~" "~/bibliography/" "~/LaTeX/")))
 '(ebib-default-entry-type "Book")
 '(ebib-keywords-field-keep-sorted t)
 '(ebib-keywords-file "~/bibliography/ebib-keywords.txt")
 '(ebib-keywords-list (quote ("epub" "humble bundle")))
 '(ebib-reading-list-file "my-toread-list.txt")
 '(ebib-use-timestamp t)
 '(package-selected-packages
   (quote
	(popup xkcd writeroom-mode unbound private-diary palimpsest material-theme magit lorem-ipsum elpy ecb color-theme bbdb autopair auctex-latexmk 2048-game)))
 '(reftex-insert-label-flags (quote (t t)))
 '(remember-data-directory "~/Dropbox/remember")
 '(remember-data-file "~/Dropbox/remember/notes")
 '(remember-mode-hook (quote (flyspell-mode turn-on-auto-fill)))
 '(tramp-syntax (quote default) nil (tramp)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
