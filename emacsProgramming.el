;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  emacsProgramming.el: Make programming easier and better.
;;
;; Time-stamp: "2017-10-31 10:26:27 richard"
;;
;; Emacs provides support for all manner of programming languages, so
;;  this file could get quite lengthy, and may need splitting out
;;  again. Currently aimed at C/C++ and Python.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; C Mode:
;; Auto-filling is switched on elsewhere.
;;
;; Electric functions are activated here.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Comments on programming support: These initial settings are derived
;; from a page about setting up the perfect environment for C/C++
;; programming.
;;
;; https://truongtx.me/2013/03/10/emacs-setting-up-perfect-environment
;; -for-cc-programming
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cc-mode)
(setq-default c-basic-offset 4 c-default-style "stroustrup")
(setq-default tab-width 4 indent-tabs-mode t)
(electric-pair-mode t)
(add-hook 'c-mode-hook
	  '(lambda ()
	     (c-set-style "stroustrup")
	     (c-toggle-auto-state 1)
	     (c-toggle-hungry-state 1)))
;(require 'autopair)
;(setq autopair-autowrap t)
