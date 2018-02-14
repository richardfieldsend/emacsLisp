;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; emacsExperimental.el - initialisation functions testing.
;;
;; Time-stamp: "2018-02-14 10:22:40 richard"
;;
;;   ___ _ __ ___   __ _  ___ ___
;;  / _ \ '_ ` _ \ / _` |/ __/ __|
;; |  __/ | | | | | (_| | (__\__ \
;;  \___|_| |_| |_|\__,_|\___|___/
;;  _____                      _                      _        _
;; | ____|_  ___ __   ___ _ __(_)_ __ ___   ___ _ __ | |_ __ _| |
;; |  _| \ \/ / '_ \ / _ \ '__| | '_ ` _ \ / _ \ '_ \| __/ _` | |
;; | |___ >  <| |_) |  __/ |  | | | | | | |  __/ | | | || (_| | |
;; |_____/_/\_\ .__/ \___|_|  |_|_| |_| |_|\___|_| |_|\__\__,_|_|
;;            |_|
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Time stamp functionality - time stamp in the first 8 lines of the
;; file will automatically update whenever the file is saved. The time
;; stamp needs to be in the format:
;;
;; Time-stamp: " " - angle brackets  < > can be used instead.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-pattern nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remove extra whitespace at the end of the document when saving it.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Accept y/n answers rather than requiring yes/no
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(fset 'yes-or-no-p 'y-or-n-p)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Visual bell rather than irritating audible bell
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq visible-bell t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dynamic abbreviation functionality:
;;
;; Minimise typing in Emacs. This uses two approaches.
;;
;; dabbrev: no need to configure (dynamic abbreviation). To repeat a
;; phrase already typed start typing the new item then type M-/
;; (alt-/) and Emacs will expand with the most recent entry. Repeat
;; the M-/ to go back through the matches.
;;
;; abbreviation mode - add entries to a file which will expand
;; automatically. Abbreviations can be global or mode based.
;;
;; To configure an automatically expanding abbreviation you enter the
;; text you want to expand. Then type C-x a g to trigger the global
;; add. To add multiple worded abbreviations type C-u <no> C-x a g
;; where <no> is the number of words that the abbreviation will expand
;; to. Then type the abbreviated form.
;;
;; To add mode based abbreviations C-x a l.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default abbrev-mode t)
(setq abbrev-file-name "~/emacsLisp/abbrev_defs") ; where
					; abbreviations are stored.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Turn on word wrap for specific modes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'text-mode-hook 'auto-fill-mode) ; text mode word wrap
(add-hook 'emacs-lisp-mode-hook 'auto-fill-mode) ; list mode word wrap
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Backing up files each time a file is saved - but crop the number of
;; files  if it gets too high.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq make-backup-files t		; make backups
      backup-by-copying t		; don't clobber files
      version-control t			; number the backups
      kept-old-versions 3		; see link to info about this
      kept-new-versions 2		; https://www.gnu.org/software/emacs/manual/html_node/emacs/Backup-Deletion.html
      auto-save-default t		; auto-save buffers
      auto-save-timeout 30		; delay till the save (time in seconds)
      auto-save-interval 100		; delay till the save (keystrokes)
      vc-make-backup-files t		;
      )
(setq delete-old-versions t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Use UTF-8 everywhere in Emacs. You know you want to!
;;
;; As outlined on this page:
;;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(when (display-graphic-p)
   (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ebib
;;
;; Repository information (parsebib):
;; origin  https://github.com/joostkremers/parsebib.git (fetch)
;; origin  https://github.com/joostkremers/parsebib.git (push)
;;
;; Repository information (ebib):
;; origin  https://github.com/joostkremers/ebib.git (fetch)
;; origin  https://github.com/joostkremers/ebib.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/parsebib")
(require 'parsebib)
(add-to-list 'load-path "~/emacsExtRepos/ebib")
(require 'ebib)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remember - from repository
;;
;; Repository information:
;; origin  git://repo.or.cz/remember-el.git (fetch)
;; origin  git://repo.or.cz/remember-el.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/remember")
(require 'remember)
;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; org remember settings
;; as outlined in this page:
;; http://members.optusnet.com.au/~charles57/GTD/remember.html#sec-3
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq org-directory "~/Dropbox/orgfiles/")
;; (setq org-default-notes-file "~/Dropbox/.orgnotes")
;; (setq remember-annotation-functions '(org-remember-annotation))
;; (setq remember-handler-functions '(org-remember-handler))
;; (add-hook 'remember-mode-hook 'org-remember-apply-template)
;; (define-key global-map "\C-cr" 'org-remember)

;; (setq org-remember-templates
;;      '(("Todo" ?t "* TODO %? %^g\n %i\n " "~/Dropbox/orgfiles/newgtd.org" "Office")
;;       ("Journal" ?j "\n* %^{topic} %T \n%i%?\n" "~/Dropbox/orgfiles/journal.org")
;;       ("Book" ?b "\n* %^{Book Title} %t :READING: \n%[l:/booktemp.txt]\n"
;;               "~/Dropbox/orgfiles/journal2.org")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Big Brother Insidious Database
;;
;; Once installed, I have also customised the configuration so that it
;; is looking for the bbdb data file in ~/Dropbox/bbdb.  That way the
;; file is available at home as well as at work.
;;
;; Repository information:
;; origin  https://git.savannah.nongnu.org/git/bbdb.git (fetch)
;; origin  https://git.savannah.nongnu.org/git/bbdb.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/bbdb/lisp")

(require 'bbdb-loaddefs "~/emacsExtRepos/bbdb/lisp/bbdb-loaddefs.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lorem-ipsum - from the repository.
;;
;; Lorem-ipsum is a way of adding filler text to check layout etc.
;; Now installed from the repo.
;;
;; Repository information:
;; origin  https://github.com/jschaf/emacs-lorem-ipsum (fetch)
;; origin  https://github.com/jschaf/emacs-lorem-ipsum (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/emacs-lorem-ipsum")
(require 'lorem-ipsum)
(global-set-key (kbd "C-c C-l s") 'lorem-ipsum-insert-sentences)
(global-set-key (kbd "C-c C-l p") 'lorem-ipsum-insert-paragraphs)
(global-set-key (kbd "C-c C-l l") 'lorem-ipsum-insert-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile
;;
;; Repository information:
;; origin  https://github.com/bbatsov/projectile.git (fetch)
;; origin  https://github.com/bbatsov/projectile.git (push)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/projectile")
(require 'projectile)
(projectile-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Set latitude and longtitude (to display sunrise/sunset times)
;;
;; See:
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/
;; Sunrise_002fSunset.html#Sunrise_002fSunset
;;
;; Notes:
;; To view sunrise/sunset for 'today' M-x sunrise-sunset
;; For specific date: C-u M-x sunrise-sunset and enter date
;; For month (from calendar display) M-x calendar-sunrise-sunset-month
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq calendar-latitude 52.1)
(setq calendar-longitude 0.3)
(setq calendar-location-name "Linton, Cambridgeshire")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Enable yasnippets mode
;;
;; Repository information:
;; https://github.com/joaotavora/yasnippet
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; I have cloned the yasnippets snippets collection from this
;; repository:
;;
;; git@github.com:AndreaCrotti/yasnippet-snippets.git
;;
;; The code below imports the snippets from the repository and from a
;; local repository when it is available.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq yas-snippet-dirs
      '("~/emacsLisp/snippets"                 ;; personal snippets
        "~/emacsExtRepos/yasnippet-snippets/snippets/"           ;; foo-mode and bar-mode snippet collection
       ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Save Place - save where you are in the document so you go back
;; there automagically.
;;
;; As described here: https://www.emacswiki.org/emacs/SavePlace
;;
;; This is built in in Emacs after v. 24.5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(save-place-mode 1)
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; websocket activation
;;
;; Repository information
;; https://github.com/ahyatt/emacs-websocket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/emacs-websocket/")
(require 'websocket)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; iPython/Jupyter configuration.
;;
;; Repository information:
;; https://github.com/tkf/emacs-ipython-notebook
;;
;; Information on setting this up here:
;; https://realpython.com/blog/python/emacs-the-best-python-editor/
;; http://jupyter-notebook-beginner-guide.readthedocs.io/en/latest/what_is_jupyter.html
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/emacs-ipython-notebook/lisp/")
(require 'ein)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nhxtml - for doing html and stuff
;;
;; git repository information
;; git@github.com:jwiegley/nxhtml.git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;(load "~/emacsExtRepos/nxhtml/autostart.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nxml mode - for xml and similar documents.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/emacsExtRepos/nxml-mode-20041004/")
(load "~/emacsExtRepos/nxml-mode-20041004/rng-auto.el")
(setq auto-mode-alist
	  (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\|html\\)\\'" .nxml-mode)
			auto-mode-alist))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; turn off frame stuff
;;
;; As described in a reddit post
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (toggle-frame-fullscreen)
;;
;; I have commented this out because this switch forces full screen
;; which means that Emacs doesn't share space with anything else! Not
;; having the frame was nice, but if you want to have anything else on
;; screen it doesn't work.  You can always toggle this using M-x
;; toggle-frame-fullscreen.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
