;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsWriting.el: Configuring writing tools and techniques for using
;; Emacs to create text.
;;
;; Time-stamp: "2017-11-02 23:47:08 rf343"
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Define using British dictionary and activate ispell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ispell)
(setq ispell-dictionary "british")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Palimpsest - safe text rather than just deleting it
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/Palimpsest")
(add-hook 'text-mode-hook 'palimpsest-mode)
(add-hook 'LaTeX-mode-hook 'palimpsest-mode)
(add-hook 'emacs-lisp-mode-hook 'palimpsest-mode)
(add-hook 'c-mode-hook 'palimpsest-mode)
