;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsAppearance.el: Look and feel settings for Emacs
;;
;; Time-stamp: "2018-01-03 13:00:55 rf343"
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
(if (string= system-name "plantsci-cowin01")
	(setq initial-scratch-message
		  "The most exciting phrase to hear in science, the one that heralds the most discoveries, is\nnot 'Eureka! (I found it!), but 'That's funny...'\n\nIsaac Asimov"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(menu-bar-mode 0)			; Turn off menu bar
(tool-bar-mode 0)			; Turn off tool bar
(blink-cursor-mode 0)			; Turn off blinking cursor
(scroll-bar-mode 0)			; We don't need a scroll bar

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Activate a colour theme
;;
;; Repository information:
;; origin  https://github.com/cpaulik/emacs-material-theme.git (fetch)
;; origin  https://github.com/cpaulik/emacs-material-theme.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/emacs-material-theme")
(require 'material-theme)
(load-theme 'material t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rainbow delimeters
;;
;; Repository information:
;; origin  https://github.com/Fanael/rainbow-delimiters.git (fetch)
;; origin  https://github.com/Fanael/rainbow-delimiters.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/rainbow-delimiters")
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'LaTeX-mode-hook 'rainbow-delimiters-mode)
(add-hook 'text-mode-hook 'rainbow-delimiters-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn on outline-minor-mode for various modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'LaTeX-mode-hook 'outline-minor-mode)
(add-hook 'prog-mode-hook 'outline-minor-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn on global line numbering at the start of the line.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-linum-mode t)
