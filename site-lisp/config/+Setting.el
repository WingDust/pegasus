;;; -*- lexical-binding: t; -*-

(require 'package)
(setq package-archives '(
                         ("melpa-cn" . "http://elpa.zilongshanren.com/melpa/")
                         ("gnu-cn"   . "http://elpa.zilongshanren.com/gnu/")
                         ("org-cn" . "http://elpa.zilongshanren.com/org/")
                         ))

;; (package-initialize)

(defun add-packages-to-load-path (package-path)
  (let* ((subdir
          (mapcar
           (lambda (dir)
                (concat (file-name-as-directory package-path) dir)
             )
                (cl-remove-if
                        #'(lambda (subdir)
                        (member subdir
                                '(
                                "gnupg"
                                "archives"
                                "."
                                ".."
                                )
                                )
                        )
                        (directory-files  package-path)
                        )
           )
         ))

    (mapc
     (lambda (i)
    (add-to-list 'load-path i)
       )
     subdir
        )
    )
  )
(add-packages-to-load-path "~/.emacs.d/elpa")
;; (add-packages-to-load-path "H:/Work/framework/site-lisp/extension")
(add-packages-to-load-path (concat config-path "site-lisp/extension"))
(add-to-list 'load-path  (concat config-path "site-lisp/extension"))

(set-scroll-bar-mode nil)
(tool-bar-mode -1)
(menu-bar-mode -1)                      ;禁用菜单栏

(setq-default mode-line-format nil)

(fset 'yes-or-no-p 'y-or-n-p)
;以 y/n代表 yes/no

(setq inhibit-splash-screen t)         ; hide welcome screen

(setq delete-by-moving-to-trash t)

(setq ring-bell-function 'ignore)

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(setq auto-save-default nil)

(setq initial-scratch-message nil)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
