;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsAppearance.el: Look and feel settings for Emacs
;;
;; Time-stamp: "2017-11-09 14:14:43 richard"
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
	  "I use Emacs, which might be thought of as a thermonuclear word processor.\n\nNeal Stephenson - \n\tIn The Beginning...was the Command Line"))
(if (string= system-name "psychol-ford")
    (setq initial-scratch-message
	  "'Space,' it says, 'is big. Really big. You just won't believe how vastly, hugely, mindbogglingly big it is.\nI mean, you may think it's a long way down the road to the chemist, but that's just peanuts to space.'\n\nHitch Hikers Guide To The Galaxy\n\tDouglas Adams."))


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
;; (add-to-list 'load-path "~/emacsExtRepos/color-theme/")
;; (require 'color-theme)
;; (setq color-theme-is-global t)
;; (color-theme-initialize)
;; (color-theme-pok-wog)
(add-to-list 'load-path "~/emacsExtRepos/emacs-material-theme")
(require 'material-theme)
(load-theme 'material t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rainbow delimeters
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/rainbow-delimiters")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'LaTeX-mode-hook 'rainbow-delimiters-mode)
(add-hook 'text-mode-hook 'rainbow-delimiters-mode)
