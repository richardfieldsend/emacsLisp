;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsAppearance.el: Look and feel settings for Emacs
;;
;; Time-stamp: "2018-02-14 00:36:55 rf343"
;;
;;
;;   ___ _ __ ___   __ _  ___ ___
;;  / _ \ '_ ` _ \ / _` |/ __/ __|
;; |  __/ | | | | | (_| | (__\__ \
;;  \___|_| |_| |_|\__,_|\___|___/
;;
;;     _
;;    / \   _ __  _ __   ___  __ _ _ __ __ _ _ __   ___ ___
;;   / _ \ | '_ \| '_ \ / _ \/ _` | '__/ _` | '_ \ / __/ _ \
;;  / ___ \| |_) | |_) |  __/ (_| | | | (_| | | | | (_|  __/
;; /_/   \_\ .__/| .__/ \___|\__,_|_|  \__,_|_| |_|\___\___|
;;         |_|   |_|
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Initial appearance configuration - inspired by Emacs striptease
;; page at: http://emacs-doctor.com/emacs-strip-tease.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq inhibit-startup-message t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; font stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(set-face-attribute 'default nil
					:font "Inconsolata Medium"
					:height 75)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set startup message on the basis of the system name...
;;
;; The scratch buffer is almost entirely empty, apart from the quotes
;; below, which are displayed on the basis of the system name in
;; question.  To highlight which one has each quote I have commented
;; on the machine name.
;;
;; ziggy-latitude - my home laptop (an old Dell Latitude, hence the name)
(if (string= system-name "ziggy-latitude")
    (setq initial-scratch-message
	  "I use Emacs, which might be thought of as a thermonuclear word
processor.\n\nNeal Stephenson - \n\tIn The Beginning...was the Command Line"))
;;
;; psychol-ford - my iMac running Linux Mint
(if (string= system-name "psychol-ford")
    (setq initial-scratch-message
		  "'Space,' it says, 'is big. Really big. You just won't believe how vastly, hugely, mindbogglingly big it is.\nI mean, you may think it's a long way down the road to the chemist, but that's just peanuts to space.'\n\nHitch Hikers Guide To The Galaxy\n\tDouglas Adams."))
;;
;; plantsci-cowin01 - Plant Sciences desktop (don't know why it is
;; referred to as cowin01 as it hasn't run Windows under my watch!)
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Minimap mode
;;
;; Repository information:
;; origin  https://github.com/dengste/minimap.git (fetch)
;; origin  https://github.com/dengste/minimap.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/minimap")
(require 'minimap)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual fill column (dependency for writeroom mode)
;;
;; Repository information:
;; origin  git@github.com:joostkremers/visual-fill-column.git (fetch)
;; origin  git@github.com:joostkremers/visual-fill-column.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/visual-fill-column")
(require 'visual-fill-column)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Writeroom mode
;;
;; Repository information:
;; origin  git@github.com:joostkremers/writeroom-mode.git (fetch)
;; origin  git@github.com:joostkremers/writeroom-mode.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/writeroom-mode")
(require 'writeroom-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight the current line to help focus the eyes (using the
;; built-in hl-line-mode). Instructions on doing this were found here:
;; http://emacsblog.org/2007/04/09/highlight-the-current-line/
;;
;; Other methods are available for this highlighting, but if this
;; works it doesn't require any extra libraries.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-hl-line-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Zone Mode - a sort of screen saver
;;
;; See the page here: https://www.emacswiki.org/emacs/ZoneMode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'zone)
(zone-when-idle 120)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Very silly - but this is NyanCat mode
;;
;; Repository information:
;; origin  https://github.com/TeMPOraL/nyan-mode.git (fetch)
;; origin  https://github.com/TeMPOraL/nyan-mode.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/nyan-mode")
(require 'nyan-mode)
(nyan-mode)
