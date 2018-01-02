;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsWriting.el: Configuring writing tools and techniques for using
;; Emacs to create text.
;;
;; Time-stamp: "2018-01-02 17:19:06 richard"
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define using British dictionary and activate ispell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ispell)
(setq ispell-dictionary "british")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Palimpsest - safe text rather than just deleting it
;;
;; Repository information:
;; origin  https://github.com/danielsz/Palimpsest.git (fetch)
;; origin  https://github.com/danielsz/Palimpsest.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/Palimpsest")
(require 'palimpsest)
;(add-hook 'text-mode-hook 'palimpsest-mode)
;(add-hook 'LaTeX-mode-hook 'palimpsest-mode)
;(add-hook 'emacs-lisp-mode-hook 'palimpsest-mode)
;(add-hook 'c-mode-hook 'palimpsest-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Journal mode - quick and dirty journal writing (should investigate
;; alternate methods too.)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load "journal")
