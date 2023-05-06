;;; -*- lexical-binding: t; -*-

(setq org-image-actual-width nil)

(add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

;; (require 'org-superstar)
;;     (setq org-superstar-headline-bullets-list '("⬡" "◉" "›" "▷" "○");;◆
;;         org-superstar-prettify-item-bullets t )
;;         (setq org-superstar-item-bullet-alist '((?* . ?•)
;;                                                 (?+ . ?•)
;;                                                 (?- . ?•)))

(font-lock-add-keywords 'org-mode
                         '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

(add-hook 'org-mode-hook 'org-indent-mode)

(setq org-hide-emphasis-markers t)

(setq org-superstar-leading-bullet "  ")

(setq org-cycle-separator-lines -1)

(pcase (which-os)
  ('(win64)
   (progn
     (setq python-shell-interpreter "e:\\python\\python3.10.5\\python3.exe"
           org-babel-python-command "e:\\python\\python3.10.5\\python3.exe"
           )
     )
   )
  )

;;;'org-babel-execute:python
;;(setq python-shell-interpreter "e:\\python\\python3.10.5\\python3.exe"
;;        org-babel-python-command "e:\\python\\python3.10.5\\python3.exe"
;;        )

;; (require 'ob-js)

(require 'ob-lilypond)
  (pcase (which-os)
    ('(win64)
     (progn
       (setq 
             org-babel-lilypond-command "C:\\Users\\Administrator\\scoop\\shims\\lilypond.exe
"
             )
       )
     )

    ('(mac)
     (progn
       (setq org-babel-lilypond-command "/opt/homebrew/bin/lilypond")
       (setq org-babel-lilypond-ly-command "/opt/homebrew/bin/lilypond")
       )
     )
    )

(with-eval-after-load 'org
    (org-babel-do-load-languages
    'org-babel-load-languages
    '(  (emacs-lisp . t)
        (python . t)
        (js . t)
        (d2 . t)
        (shell . t)
        (sql . t)
        (lilypond . t)
;;        (rust . t)
        ;; (deno . t)
        ;;(powershell . t)
    ))
)

(font-lock-add-keywords 'org-mode
                         '(("^ *\\([-]\\) "
                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

;; (after! org
;;   (setq org-tags-column -80)
;;    ;; ... other org configuration here
;; )
;; SPA-u C-c C-c

;;(setq org-ellipsis "⤵")
;;(setq org-ellipsis "…")
(setq org-ellipsis nil)

;;(require 'org-starless)
;;(add-hook 'org-mode-hook #'org-starless-mode)

;; (add-hook 'org-mode-hook #'valign-mode)
;; (add-hook 'markdown-mode-hook #'valign-mode)

(add-hook 'org-mode-hook #'org-num-mode)

;; (setq org-refile-targets '((nil :maxlevel . 9)
;;                            (org-agenda-files :maxlevel . 3)
;;                            (org-buffer-list :maxlevel . 2)))

(setq
    org-outline-path-complete-in-steps nil
    org-refile-allow-creating-parent-nodes 'confirm
    org-refile-use-outline-path 'file
    org-refile-targets '((nil :maxlevel . 5)
                           (org-agenda-files :maxlevel . 4))
    )

(require 'org-appear) 
(add-hook 'org-mode-hook 'org-appear-mode)
(setq org-appear-autolinks t)

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

;; (add-hook 'org-mode-hook
;;     (setq line-spacing 0.1)
;;     (setq header-line-format " ")
;;     (lambda () (progn
;;         (setq left-margin-width 2)
;;         (setq right-margin-width 2)
;;         (set-window-buffer nil (current-buffer))))
;;           )

;; (setq header-line-format " ")

;; (lambda () (progn
;;   (setq left-margin-width 2)
;;   (setq right-margin-width 2)
;;   (set-window-buffer nil (current-buffer))))

(setq x-underline-at-descent-line t)

(pcase (which-os)
    ('(win64)
     (progn

(setq org-agenda-files (list
                        ;;"H:/Work/framework/Site/org/Trivia.org"
                        "H:/Work/framework/Site/org/Daily.org"
                        ))
       )
     )
    )
;; (after! org
        ;; 设置状态序列
        ;; 一个 buffer 会有监时的 org-todo-keywords,所以需要重新加载 buffer
        (setq org-todo-keywords
        '((sequence
                "TODO(t)"
                "IDEA"
                "Destory"
                "INBOX(i)"
                "NEXT(n)"
                "LATER(l)"
                ;; "WAIT/FORWARD(w)"
                ;; "MAYBE/FUTURE(m)"
                "Fancy"
                "|"
                "CANCEL(c)"
                "DONE(d)" )))

        ;; set color for keywords
        (setq org-todo-keyword-faces
        '(
                ("IDEA" . (:foreground "azure" :weight bold))
                ("Destory" . (:foreground "LightPink"))
                ("INBOX" . (:foreground "#677691" :weight bold))
                ("NEXT"  .  org-warning)
                ("LATER" . "#3B4252")
                ;; ("WAIT/FORWARD" . "blue")
                ;; ("MAYBE/FUTURE" . "purple")
                ("DONE" . "#81A1C1")
                ("CANCEL" ."grey")
                ("Fancy" . "#D08770")
                )
        )
;;                 )

;; (after! org-fancy-priorities
;;   (setq
;;    org-startup-folded 'content
;;    org-priority-highest '?A
;;    org-priority-lowest  '?D
;;    org-priority-default '?D
;;    org-priority-start-cycle-with-default t
;;    org-priority-faces '((?A :foreground "#F54768")
;;                         (?B :foreground "#F5C747")
;;                         (?C :foreground "#62A6EB")
;;                         (?D :foreground "#A0A0A0"))
;;    ;; org-fancy-priorities-list '("🅐","🅑","🅒","🅓")));;这个适合亮色主题
;;    org-fancy-priorities-list '("[A]","[B]","[C]","[D]")))
;; 
(require 'org-fancy-priorities)

  (setq
   org-startup-folded 'content
   org-priority-highest '?A
   org-priority-lowest  '?D
   org-priority-default '?D
   org-priority-start-cycle-with-default t
   org-priority-faces '((?A :foreground "#F54768")
                        (?B :foreground "#F5C747")
                        (?C :foreground "#62A6EB")
                        (?D :foreground "#A0A0A0"))
   ;; org-fancy-priorities-list '("🅐","🅑","🅒","🅓")));;这个适合亮色主题
   org-fancy-priorities-list '("[A]","[B]","[C]","[D]"))
(add-hook 'org-agenda-mode-hook 'org-fancy-priorities-mode)

;; 目前只在高版本 org 支持

;; (defvar idle-agenda-timer nil)

;; (defun idle-show-agenda()
;;         (org-agenda nil "n")
;;   )

;; (defun idle-show-agenda-set-timer()
;;   ;; (interactive)
;;    (setq idle-agenda-timer 
;;        (run-with-idle-timer 3600 t 'idle-show-agenda)
;;      )
;;     )
;; (idle-show-agenda-set-timer)
;; (defun disable-idle-show-agenda()
;;   (interactive)
;;   (when idle-agenda-timer
;;     (cancel-timer idle-agenda-timer)
;;     (setq idle-agenda-timer nil)
;;     )
;; )

(setq system-time-locale "C")
