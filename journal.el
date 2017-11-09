
;; Functions to maintain a simple personal diary / journal in Emacs.
;; Feel free to use, modify and improve the code! - mtvoid

;; Some basic information before you get started: First, make sure
;; this file is loaded when you start your Emacs session by copying it
;; into your load path and adding the line (load "journal") into your
;; .emacs. You also need to specify the directory where your journal
;; files will be saved. You can do this by setting the variable
;; journal-dir in your .emacs (remember to put a trailing
;; slash). journal-dir is also a customizable variable.
;;
;; Inside the journal directory, a separate file is created for each
;; day with a journal entry, with a filename in the format YYYYMMDD.
;; Each journal entry begins with the date on the top, followed by the
;; time. Any subsequent entries on the same day are written in the
;; same file, with their own timestamp. You can customize the date and
;; time formats (or remove them entirely). To start writing a journal
;; entry, press "C-c j".
;;
;; You can browse through existing journal entries on disk via the
;; calendar. All dates for which an entry is present are highlighted.
;; Pressing "j" will open it up for viewing. Pressing [ or ] will
;; select the date with the previous or next journal entry,
;; respectively.
;;
;; If you prefer using a different face for displaying the text of
;; your journal entries, you can customize the face 'journal'.
;;
;; Quick summary:
;; To create a new journal entry: C-c j
;; In calendar view: j to view an entry
;;                   [ to go to previous entry
;;                   ] to go to next entry


; Customizable variables
(defgroup journal nil "Settings for the personal journal" :group
'applications)
(defcustom journal-dir "~/Dropbox/emacsJournal/" "Directory containing journal entries"
  :type 'string :group 'journal)
(defcustom journal-date-format "%x%n"
  "Format string for date, by default YYYY-MM-DD."
  :type 'string :group 'journal)
(defcustom journal-time-format "%n%R%n"
  "Format string for time, by default HH:MM. Set it to a blank string if you want to disable timestamps."
  :type 'string :group 'journal)
(defface journal '((t nil)) "Custom face to use in the journal" :group 'journal)

;(defvar journal-dir "~/Dropbox/emacsJournal/") ; Directory containing journal files
(defvar journal-date-list nil)
(defvar journal-file)

;; Automatically switch to journal mode when opening a journal entry file
(add-to-list 'auto-mode-alist
	     (cons (concat (car (last (split-string journal-dir "/" t)))
			   "/[0-9]\\{8\\}$") 'journal-mode))

(require 'calendar)
(add-hook 'calendar-initial-window-hook 'journal-get-list)
(add-hook 'calendar-today-visible-hook 'journal-mark-entries)
(add-hook 'calendar-today-invisible-hook 'journal-mark-entries)

;; Key bindings
(define-key calendar-mode-map "j" 'journal-read-entry)
(define-key calendar-mode-map "]" 'journal-next-entry)
(define-key calendar-mode-map "[" 'journal-previous-entry)
(global-set-key "\C-cj" 'journal-new-entry)

;; Journal mode definition
(define-derived-mode journal-mode text-mode "Journal" "Mode for writing or viewing entries written in the journal"
  (turn-on-visual-line-mode)
  (buffer-face-set 'journal)
  (add-hook 'change-major-mode-hook '(lambda nil (set-text-properties (point-min) (point-max) nil)) t t)
  (run-mode-hooks))

(add-hook 'journal-mode-hook 'journal-format-title)

(defun journal-format-title nil
  (save-excursion
    (let ((unsaved (buffer-modified-p)))
      (set-text-properties 1 (point-at-eol (goto-char (point-min)))
			   '(face (:height 1.5 :underline t)))
      (set-buffer-modified-p unsaved))))

;; Creates a new entry
(defun journal-new-entry nil "Open today's journal file and start a new entry"
  (interactive)
  (unless (file-exists-p journal-dir) (error "Journal directory %s not found" journal-dir))
  (find-file (concat journal-dir (format-time-string "%Y%m%d")))
  (if view-mode (view-mode-disable))
  (setq buffer-read-only nil)
  (goto-char (point-max))
  (let ((unsaved (buffer-modified-p)))
    (if (equal (point-max) 1) (insert (format-time-string journal-date-format)))
    (unless (eq (current-column) 0) (insert "\n"))
    (remove-text-properties (point-min) (point-max) '(face))
    (let ((beg (point)))
      (insert (format-time-string journal-time-format)"\n")
      (put-text-property beg (max beg (- (point) 1)) 'face '(:weight bold)))
    (set-buffer-modified-p unsaved))
  (journal-format-title))

;;
;; Functions to browse existing journal entries using the calendar
;;

(defun journal-get-list nil "Loads the list of files in the journal directory, and converts it into a list of calendar DATE elements"
  (unless (file-exists-p journal-dir) (error "Journal directory %s not found" journal-dir))
  (setq journal-date-list
	(mapcar '(lambda (journal-file)
		   (let ((y (string-to-number (substring journal-file 0 4)))
			 (m (string-to-number (substring journal-file 4 6)))
			 (d (string-to-number (substring journal-file 6 8))))
		     (list m d y)))
		   (directory-files journal-dir nil "^[0-9]\\{8\\}$" nil)))
  (calendar-redraw))

(defun journal-mark-entries nil "Mark days in the calendar for which a diary entry is present"
  (dolist (journal-entry journal-date-list)
    (if (calendar-date-is-visible-p journal-entry)
      (calendar-mark-visible-date journal-entry))))

(defun journal-read-entry nil "Open journal entry for selected date for viewing"
  (interactive)
  (setq journal-file (int-to-string (+ (* 10000 (nth 2 (calendar-cursor-to-date))) (* 100 (nth 0 (calendar-cursor-to-date))) (nth 1 (calendar-cursor-to-date)))))
  (if (file-exists-p (concat journal-dir journal-file))
      (view-file-other-window (concat journal-dir journal-file))
    (message "No journal entry for this date.")))

(defun journal-next-entry nil "Go to the next date with a journal entry"
  (interactive)
  (let ((dates journal-date-list))
    (while (and dates (not (calendar-date-compare (list (calendar-cursor-to-date)) dates)))
      (setq dates (cdr dates)))
    (if dates (calendar-goto-date (car dates)))))

(defun journal-previous-entry nil "Go to the previous date with a journal entry"
  (interactive)
  (let ((dates (reverse journal-date-list)))
    (while (and dates (not (calendar-date-compare dates (list (calendar-cursor-to-date)))))
      (setq dates (cdr dates)))
    (if dates (calendar-goto-date (car dates)))))

(provide 'journal)
