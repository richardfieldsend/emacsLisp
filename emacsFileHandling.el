;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; emacsFileHandling.el - managing aspects of how Emacs deals with
;; files.
;;
;; * recentf: quickly access previously opened files.
;;
;; Time-stamp: "2018-02-14 00:39:26 rf343"
;;
;;   ___ _ __ ___   __ _  ___ ___
;;  / _ \ '_ ` _ \ / _` |/ __/ __|
;; |  __/ | | | | | (_| | (__\__ \
;;  \___|_| |_| |_|\__,_|\___|___/
;;  _____ _ _      _   _                 _ _ _
;; |  ___(_) | ___| | | | __ _ _ __   __| | (_)_ __   __ _
;; | |_  | | |/ _ \ |_| |/ _` | '_ \ / _` | | | '_ \ / _` |
;; |  _| | | |  __/  _  | (_| | | | | (_| | | | | | | (_| |
;; |_|   |_|_|\___|_| |_|\__,_|_| |_|\__,_|_|_|_| |_|\__, |
;;                                                   |___/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; recentf - open recent files.
;;
;; To use the recent files function (as there is no menu) use
;; 'recent-open-files' function. This will list all recently opened
;; files, the most recent 10 of which can be selected using a one
;; digit number. Other entries can be opened by navigating the
;; selection highlight and hitting enter.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set Emacs to save the list of recently opened files once every five
;; minutes (default is to save at exit).
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(run-at-time nil (* 5 60) 'recentf-save-list)
