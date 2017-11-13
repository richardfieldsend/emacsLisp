(TeX-add-style-hook "Notes"
 (lambda ()
    (LaTeX-add-labels
     "sec:notes-emacs-init")
    (TeX-run-style-hooks
     "latex2e"
     "art10"
     "article"
     "a4paper")))

