;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; OrgMode Initialisation File: Install and enable OrgMode.
;;
;; Time-stamp: "2018-02-14 10:24:12 richard"
;;
;;                                   ___            __  __           _
;;   ___ _ __ ___   __ _  ___ ___   / _ \ _ __ __ _|  \/  | ___   __| | ___
;;  / _ \ '_ ` _ \ / _` |/ __/ __| | | | | '__/ _` | |\/| |/ _ \ / _` |/ _ \
;; |  __/ | | | | | (_| | (__\__ \ | |_| | | | (_| | |  | | (_) | (_| |  __/
;;  \___|_| |_| |_|\__,_|\___|___/  \___/|_|  \__, |_|  |_|\___/ \__,_|\___|
;;                                            |___/
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Installed OrgMode within the emacsExtRepos folder following
;; instructions here: http://orgmode.org/manual/Installation.html
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set folders for org-mode installation to be on load-path
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Installation from repository
;;
;; Repository information:
;; origin  https://github.com/jwiegley/org-mode.git (fetch)
;; origin  https://github.com/jwiegley/org-mode.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/org-mode/lisp")
(add-to-list 'load-path "~/emacsExtRepos/org-mode/contrib/lisp" t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add folder for org-bullets (pretty bullets) to be on load-path
;;
;; Repository information:
;; origin  https://github.com/sabof/org-bullets.git (fetch)
;; origin  https://github.com/sabof/org-bullets.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/org-bullets")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Some global key bindings for working with org-mode.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-log-done t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Insert fancy bullets
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'org-bullets)
(add-hook 'org-mode-hook
		  (lambda ()
			(org-bullets-mode t)))
(setq org-hide-leading-stars t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Add the org files (following David O'Toole org tutorial).
;;
;; will end up providing an agenda.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq org-agenda-files (list "~/Dropbox/orgfiles/work.org"
							 "~/Dropbox/orgfiles/school.org"
							 "~/Dropbox/orgfiles/home.org"))
