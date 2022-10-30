(require 'org-superstar)
    (setq org-superstar-headline-bullets-list '("⬡" "◉" "›" "▷" "○");;◆
        org-superstar-prettify-item-bullets t )
        (setq org-superstar-item-bullet-alist '((?* . ?•)
                                                (?+ . ?•)
                                                (?- . ?•)))

(font-lock-add-keywords 'org-mode
                         '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(add-hook 'org-mode-hook 'org-indent-mode)

(add-hook 'org-mode-hook #'org-num-mode)

(defun nm/add-newline-between-headlines ()
  ""
  (when (equal major-mode 'org-mode)
    (unless (org-at-heading-p)
      (org-back-to-heading))
    (nm/org-end-of-headline)
    (if (not (org--line-empty-p 1))
        (newline))))
(defun nm/org-end-of-headline()
  "Move to end of current headline"
  (interactive)
  (outline-next-heading)
  (forward-char -1))
(defun nm/newlines-between-headlines ()
  "Uses the org-map-entries function to scan through a buffer's
   contents and ensure newlines are inserted between headlines"
  (interactive)
  (org-map-entries #'nm/add-newline-between-headlines t 'file))

(defun org-show-current-heading-tidily ()
  (interactive)  ;Inteactive
  "Show next entry, keeping other entries closed."
  (if (save-excursion (end-of-line) (outline-invisible-p))
      ;;(progn (org-show-entry) (show-children))
      (progn (org-show-entry) (outline-show-children))
    (outline-back-to-heading)
    ;;(unless (and (bolp) (org-on-heading-p))
    (unless (and (bolp) (org-at-heading-p))
      (org-up-heading-safe)
      ;;(hide-subtree)
      (outline-hide-subtree)
      (error "Boundary reached"))
    (org-overview)
    (org-reveal t)
    (org-show-entry)
    ;;(show-children)))
    (outline-show-children)))
