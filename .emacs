;;; -*- lexical-binding: t; -*-

(require 'cl-lib)
(require 'org)
(require 'ob-tangle)
(require 'rx)


(if (eq system-type 'windows-nt)
    (progn
      (set-clipboard-coding-system 'utf-16-le)
      (set-selection-coding-system 'utf-16-le))
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8-unix)
;;将utf-8放到编码顺序表的最开始，即先从utf-8开始识别编码，此命令可以多次使用，后指定的编码先探测

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
(setq locale-coding-system 'utf-8-unix)
;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))) 

;; (set-buffer-file-coding-system 'utf-8-unix)
;;指定当前buffer的写入编码，只对当前buffer有效，即此命令写在配置文件中无效，只能通过M-x来执行
;; (setq default-buffer-file-coding-system 'utf-8-unix)
;;指定新建buffer的默认编码为utf-8-unix，换行符为unix的方式



;; 驴陋脝么麓掳驴脷脳卯麓贸禄炉
;;(toggle-frame-maximized)

;; 驴陋脝么脠芦脝脕脧脭脢戮
;;(toggle-frame-fullscreen 1)
(add-hook 'window-setup-hook #'toggle-frame-fullscreen)

;; @purcell
(defun sanityinc/adjust-opacity (frame incr)
  "Adjust the background opacity of FRAME by increment INCR."
  (unless (display-graphic-p frame)
    (error "Cannot adjust opacity of this frame"))
  (let* ((oldalpha (or (frame-parameter frame 'alpha) 100))
         (oldalpha (if (listp oldalpha) (car oldalpha) oldalpha))
         (newalpha (+ incr oldalpha)))
    (when (and (<= frame-alpha-lower-limit newalpha) (>= 100 newalpha))
      (modify-frame-parameters frame (list (cons 'alpha newalpha))))))

(global-set-key (kbd "M-C-8") (lambda () (interactive) (sanityinc/adjust-opacity nil -2)))
(global-set-key (kbd "M-C-9") (lambda () (interactive) (sanityinc/adjust-opacity nil 2)))
(global-set-key (kbd "M-C-7") (lambda () (interactive) (modify-frame-parameters nil `((alpha . 100)))))




;; 麓掳驴脷脥赂脙梅
(set-frame-parameter (selected-frame)'alpha '(85 . 85))
(add-to-list 'default-frame-alist'(alpha . (85 . 85)))

;; fullsreen startup
(setq initial-frame-alist (quote ((fullscreen , maximized))))


;; 赂眉赂脛脧脭脢戮脳脰脤氓麓贸脨隆 16pt

;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)


;; No line break space points
;; (setq auto-fill-mode nil)

;; Fill column at 80
;; (setq fill-column 80)


;;{{{
;; theme
;; - [[https://github.com/rougier/elegant-emacs][elegant-emacs]]
;; - [[https://github.com/kunalb/poet][poet]]
;; - [[https://github.com/arcticicestudio/nord-emacs][nord-emacs]]
;; - [[https://github.com/cpaulik/emacs-material-theme][emacs-material-theme]]
;; 脜盲脰脙 N 娄芦 N O - Emacs 碌脛 elegant-emacs
;; - 掳虏脳掳 [[https://github.com/googlefonts/RobotoMono][googlefonts/RobotoMono]] 脰脨碌脛脳脰脤氓脦脛录镁拢卢脦脪脢脟脠芦虏驴掳虏脳掳脕脣
;; - 掳虏脳掳 Fira Code =scoop install FiraCode=
;; 脜盲脰脙 N 娄芦 N O - Emacs 
;; - 掳虏脳掳 [[https://github.com/googlefonts/RobotoMono][googlefonts/RobotoMono]] 脰脨碌脛脳脰脤氓脦脛录镁拢卢脦脪脢脟脠芦虏驴掳虏脳掳脕脣
;; - 掳虏脳掳 Fira Code =scoop install FiraCode=
()
;;}}} ===========================  End  ============================


(setq x-underline-at-descent-line t)

;;(add-to-list 'load-path "H:/Work/framework/elegant-emacs")

;; (require 'elegant)

;; (add-to-list 'load-path "H:/Work/framework/nano-emacs")

;; (add-to-list 'load-path "H:/Work/framework/nano-modeline")

(setq site-lisp "~/elegant/site-lisp/")

(setq config-path (concat site-lisp "config/"))
(setq extension-path (concat site-lisp "extension/"))

(message "run")

(add-to-list 'load-path (concat extension-path  "nano-theme"))
(add-to-list 'custom-theme-load-path (concat extension-path  "nano-theme"))

;; (require 'nano)
;; (nano-mode)


;; (require 'nano-theme)
;;(require 'sanity)
;;(load-theme 'nano t)



;; (require 'nano-theme-light)
;; (set-face-attribute 'mode-line nil
;;                  :height 0.1
;;                   :box nil)
;;
;; (require 'nano-theme)
;; (require 'nano-modeline)
;; (nano-modeline-mode)
;; (setq nano-modeline-position 'bottom)


(require 'nano-theme)
(load-theme 'nano-dark t)
;;
;;

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

(defun create-empty-file-if-no-exists(filePath)
   "Create a file with FILEPATH parameter."
   (if (file-exists-p filePath)
       (message (concat  "File " (concat filePath " already exists")))
     ;; (with-temp-buffer (write-file filePath)
    (make-empty-file filePath)
                       ))


(defun compile-Org-to-elisp (file)
  (let ((tan (concat
             (file-name-sans-extension file) ".el")
            ))
    ;; (create-empty-file-if-no-exists tan)
    ;;(org-babel-tangle-file file tan "emacs-lisp\\|elisp")
    (org-babel-tangle-file file tan "emacs-lisp")
    (byte-compile-file tan)
    )
)

;; (byte-compile-file "H:/Work/framework/+Buildin.el")
;; (org-babel-tangle-file  "H:/Work/framework/+Buildin.org" "H:/Work/framework/+Buildin.el" "emacs-lisp\\|elisp")
;; (org-babel-tangle-file  "H:/Work/framework/+Buildin.org") 
;;(compile-Org-to-elisp "H:/Work/framework/+Setting.org")
(defun filter-path (path filter)
          (mapcar
           (lambda (dir)
                (concat (file-name-as-directory path) dir)
             )
                (cl-remove-if-not
                        #'(lambda (subdir)
                        (member subdir
                                filter
                                )
                        )
                        (directory-files  path)
                        )
           )
  )



;;(setq config-path "H:/Work/framework/")
;; 配置的加载顺序
(setq configs '("+OutofMy.org" "+Buildin.org" "+UI.org" "+Utils.org" "+Setting.org" "+Keybinding.org" "+Mode.org"))


(defun compile-my-config()
  (interactive)
  "编译自己的配置所有的 org 到 el 文件"
  (let*
      ((configs
        (filter-path config-path configs)
        ))
    (mapc 
     (lambda (i)
        (compile-Org-to-elisp i)
       )
     configs
     )
    )
  )
(defun compose-full-config-path()
(mapcar
 (lambda (i)
   (concat config-path i)
   )
      configs
       )
 )
;; (compose-full-config-path)

(defun load-my-config()
  (interactive)
  (mapc
   (lambda (i)
     (load (file-name-sans-extension i))
     )
        (compose-full-config-path) 
   )
  )

(load-my-config)

;; (window-divider-mode)
(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)

;; (window-divider-mode 1)
(set-face-foreground 'vertical-border "black")

(set-fringe-mode 10)

(setq default-frame-alist '(
                            (internal-border-width . 5)
                            ))
;; (setq-default line-spacing 0.2)                ;行间距
;; (setq-default left-margin-width 1 right-margin-width 1)
;; (setq-default left-margin-width 1)
;; (setq-default left-margin 1)

;; (set-window-buffer nil (current-buffer))

(defun reset-margins (&optional arg)
  "Reset the buffer margins based on the width of the frame.
  Has no effect when the frame contains multiple windows. By
  default, only adjust the margins if they are already
  non-zero. Use a prefix ARG to force the resize."
  (interactive "P")
  (unless (window-parent)
(when (or arg (> left-margin-width 0))
  (let ((width (if (< (frame-width) 100) 5 20)))
    (unless (= left-margin-width width)
      (message "run reset margins")
      (setq left-margin-width width)
      (setq right-margin-width width)
      (set-window-buffer nil (current-buffer)))))))

;; (add-hook 'window-configuration-change-hook 'reset-margins)

;; (menu-bar--display-line-numbers-mode-relative)
;; org-tree-slide
;; (require 'f)




