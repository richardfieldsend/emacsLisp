;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsVersionControl.el - Magit setup
;;
;; Time-stamp: "2018-02-14 10:26:37 richard"
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;   ___ _ __ ___   __ _  ___ ___
;;  / _ \ '_ ` _ \ / _` |/ __/ __|
;; |  __/ | | | | | (_| | (__\__ \
;;  \___|_| |_| |_|\__,_|\___|___/
;;
;; __     __            _              ____            _             _
;; \ \   / /__ _ __ ___(_) ___  _ __  / ___|___  _ __ | |_ _ __ ___ | |
;;  \ \ / / _ \ '__/ __| |/ _ \| '_ \| |   / _ \| '_ \| __| '__/ _ \| |
;;   \ V /  __/ |  \__ \ | (_) | | | | |__| (_) | | | | |_| | | (_) | |
;;    \_/ \___|_|  |___/_|\___/|_| |_|\____\___/|_| |_|\__|_|  \___/|_|
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install dash.el (required by Magit)
;;
;; Repository information:
;; origin  https://github.com/magnars/dash.el.git (fetch)
;; origin  https://github.com/magnars/dash.el.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/dash")
(require 'dash)
(require 'dash-functional)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install with-editor.el (also required by Magit)
;;
;; Repository information:
;; origin  https://github.com/magit/with-editor.git (fetch)
;; origin  https://github.com/magit/with-editor.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/with-editor")

(add-to-list 'load-path "~/emacsExtRepos/ghub")
(require 'ghub)

(add-to-list 'load-path "~/emacsExtRepos/magit-popup")
(require 'magit-popup)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Install Magit
;;
;; Repository information:
;; origin  https://github.com/magit/magit.git (fetch)
;; origin  https://github.com/magit/magit.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/magit/lisp")
(require 'magit)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
	       "~/emacsExtRepos/magit/Documentation/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Configure C-x g as magit-status
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "C-x g") 'magit-status)
