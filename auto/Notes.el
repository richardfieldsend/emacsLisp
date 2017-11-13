(TeX-add-style-hook
 "Notes"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper")))
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art10")
   (LaTeX-add-labels
    "sec:notes-emacs-init"))
 :latex)

