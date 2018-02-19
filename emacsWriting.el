;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Time-stamp: "2018-02-19 09:42:04 richard"
;;                                 __        __    _ _   _
;;   ___ _ __ ___   __ _  ___ ___  \ \      / / __(_) |_(_)_ __   __ _
;;  / _ \ '_ ` _ \ / _` |/ __/ __|  \ \ /\ / / '__| | __| | '_ \ / _` |
;; |  __/ | | | | | (_| | (__\__ \   \ V  V /| |  | | |_| | | | | (_| |
;;  \___|_| |_| |_|\__,_|\___|___/    \_/\_/ |_|  |_|\__|_|_| |_|\__, |
;;                                                               |___/
;; emacsWriting.el: Configuring writing tools and techniques for using
;; Emacs to create text.
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
