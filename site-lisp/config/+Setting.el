;;; -*- lexical-binding: t; -*-

(require 'package)
;; 修改 package-archives 后应 package-refresh-contents 
;; package--with-response-buffer-1: http://mirrors.ustc.edu.cn/elpa/melpa/find-file-in-project-20220430.107.el: Not found
;; 上面就是这个原因

(setq package-archives '(
                     ;; ("melpa-cn" . "http://mirrors.ustc.edu.cn/elpa/melpa/")
                     ;; ("gnu-cn"   . "http://mirrors.ustc.edu.cn/elpa/gnu/")
                     ("org-cn"   . "http://mirrors.ustc.edu.cn/elpa/org/")
                     ;; ("nongnu"   . "http://mirrors.ustc.edu.cn/elpa/nongnu/")
                     ("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                     ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                     ;; ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
                     ("nongnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                     ;; ("melpa-cn" . "http://1.15.88.122/melpa/")
                     ;; ("gnu-cn"   . "http://1.15.88.122/gnu/")
                     ;; ("org-cn"   . "http://1.15.88.122/org/")
                     ("melpa-stable"   . "http://1.15.88.122/stable-melpa/")
                     ;; ("melpa-stable"   . "http://1.15.88.122/stable-melpa/")
                     ;; ("nongnu"   . "http://1.15.88.122/nongnu/")
                     ;;("stable-melpa" . "http://mirrors.ustc.edu.cn/stable-melpa/")
                     ))
(setq package-check-signature nil)

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
(add-packages-to-load-path extension-path )
(add-to-list 'load-path  extension-path )

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

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq-default  tab-width 2) ;; 表示一个 tab 4个字符宽
(setq-default indent-tabs-mode nil) ;; nil 表示将 tab 替换成空格

;;(setq garbage-collection-messages t)

(global-visual-line-mode)

;; (advice-add #'message :filter-args #'message-filter-center)

;; (defun message-filter-center (args)
;;   "Center message string.
;; This is a :filter-args advice for `message`."
;;   (if (car args)
;;       (with-current-buffer (window-buffer (minibuffer-window))
;;     (let ((str (apply #'format-message args)))
;;       (list "%s" (propertize str 'line-prefix (list 'space :align-to (max 0 (/ (- (window-width (minibuffer-window)) (string-width str)) 2)))))))
;;     args))
