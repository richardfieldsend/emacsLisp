;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  emacsProgramming.el: Make programming easier and better.
;;
;; Time-stamp: "2018-01-13 21:31:46 rf343"
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python programming environment: Initially looking at the page here:
;;
;; Following instructions here:
;; https://realpython.com/blog/python/emacs-the-best-python-editor/
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(package-initialize)
(elpy-enable)
;Activate pep8 corrections when file is saved
;;
;; Repository information:
;; git@github.com:paetzke/py-autopep8.el.git
(add-to-list 'load-path "~/emacsExtRepos/py-autopep8/")
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;Activate flycheck which may be better than flymake?
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Notes on Python Mode: I have enabled elpy to manage Python
;; programming.  This provides support for pep8 which appears to be a
;; readability standard for Python which will modify the layout of
;; code if it doesn't match the standard (py-autopep8).  The code also
;; gets checked on the fly to spot issues with it.  On my work machine
;; it throws an error regarding locale issues (I assume this is
;; related to the issue that gets thrown up on the screensaver).  I
;; haven't really used this mode 'in anger', but it does some nice
;; stuff with auto-completion.
;;
;; However, it does cause an issue with AuCTex where it throws an
;; error message about latex dialect!
;;
;; Investigations are on-going.
