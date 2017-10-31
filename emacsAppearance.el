;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsAppearance.el: Look and feel settings for Emacs
;;
;; Time-stamp: "2017-10-31 00:21:33 rf343"
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initial appearance configuration - inspired by Emacs striptease
;; page at: http://emacs-doctor.com/emacs-strip-tease.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set startup message on the basis of the system name...
;;
;; ziggy-latitude
(if (string= system-name "ziggy-latitude")
    (setq initial-scratch-message
	  "I use Emacs, which might be thought of as a thermonuclear
word processor.\n\nNeal Stephenson - \n\tIn The Beginning...was the
Command Line"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(menu-bar-mode 0)			; Turn off menu bar
(tool-bar-mode 0)			; Turn off tool bar
(blink-cursor-mode 0)			; Turn off blinking cursor
(scroll-bar-mode 0)			; We don't need a scroll bar

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Activate a colour theme
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/color-theme/")
(require 'color-theme)
(setq color-theme-is-global t)
(color-theme-initialize)
(color-theme-pok-wog)
