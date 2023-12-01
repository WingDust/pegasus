;;; -*- lexical-binding: t; -*-

(when (memq window-system '(mac ns x))
(setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOROOT" "GOPATH" "EDITOR" "PYTHONPATH" "DENOTE"))

;; 设成nil 则不从 .zshrc 读 只从 .zshenv读（可以加快速度，但是需要你将环境变量相关的都放到 .zshenv 中，而非 .zshrc 中）
(setq exec-path-from-shell-check-startup-files nil) ;
(setq exec-path-from-shell-arguments '("-l" )) ;remove -i read form .zshenv
(exec-path-from-shell-initialize)
)

;;;###autoload
        (require 'counsel)
        ;;(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
        ;;(global-set-key (kbd "M-x") 'counsel-M-x)
        ;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
        ;; (global-set-key (kbd "C-s") 'counsel-line)
        ;;(global-set-key (kbd "SPC f r") 'counsel-recentf)
    (pcase (which-os)
    ('(win64)
     (progn
        (global-set-key "\C-s" 'swiper)
       )
     )
    ('(mac)
     (progn
        ;; (global-set-key (kbd "M-s") 'swiper)
        (global-set-key "\C-s" 'swiper)
       )
     )
    )

;; [[https://ladicle.com/post/config/#ivy][Ivy]]
(define-key ivy-minibuffer-map (kbd "C-w") 'ivy-backward-kill-word)
(define-key ivy-minibuffer-map (kbd "C-h") 'ivy-backward-delete-char)
      (defun counsel-home()
        (interactive)
        (counsel-fzf nil "~")
        )
    ;;(setq counsel-fzf-cmd "fd.exe --type f --hidden --follow --exclude .git --color never '%s'")
    ;; [[https://github.com/ut4k/windows-dotfiles/blob/eda4ed484078ea4309b42634737934167191951c/AppData/Roaming/.emacs#L964][fzfはうまくうごかないのでfdを代用する]]
  (setq counsel-fzf-cmd "fd --path-separator / \"%s\"")

(require 'dirvish)
(require 'dirvish-side)

(dirvish-override-dired-mode)

(add-hook 'dirvish-side-follow-mode-hook (lambda () (display-line-numbers-mode -1)))

;;Warning (evil-collection): Make sure to set `evil-want-keybinding' to nil before loading evil or evil-collection.
;;
;;See https://github.com/emacs-evil/evil-collection/issues/60 for more details.
;;Warning (evil-collection): Make sure to set `evil-want-keybinding' to nil before loading evil or evil-collection.
;;
;;See https://github.com/emacs-evil/evil-collection/issues/60 for more details.
(setq evil-want-integration t)
(setq evil-want-keybinding nil)

;;;###autoload
(require 'evil)
(evil-mode)
;; (setq-default evil-disable-insert-state-bindings t)
;; (defindebuge-key evil-insert-state-map (kbd "C-a") 'evil-beginning-of-line)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "-") 'dirvish)
(define-key evil-normal-state-map (kbd "V") 'evil-visual-block)
(define-key evil-normal-state-map (kbd "D") 'duplicate-line)

(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)


;; (define-key evil-insert-state-map (kbd "C-e") 'doom/forward-to-last-non-comment-or-eol)
;; (define-key evil-insert-state-map (kbd "C-a") 'doom/backward-to-bol-or-indent)

(define-key evil-visual-state-map (kbd "v") 'evil-visual-line)

(add-hook 'org-mode-hook '(lambda () (setq evil-auto-indent nil)))

;;;###autoload
(require 'undo-fu)

;;(global-undo-tree-mode)
;;(evil-set-undo-system 'undo-tree)
(evil-set-undo-system 'undo-fu)

;;;###autoload
(require 'evil-matchit)

(global-evil-matchit-mode 1)

(evil-define-key 'normal 'global (kbd "<tab>")  'evil-jump-item)

;;;###autoload
  (require 'evil-nerd-commenter)

  ;(global-evil-matchit-mode 1)
(global-set-key (kbd "C-;") 'evilnc-comment-or-uncomment-lines)


  ;(evil-define-key 'normal 'global (kbd "<tab>")  'evil-jump-item)

(require 'evil-vimish-fold)
(global-evil-vimish-fold-mode)

;;;###autoload
(require 'alda-mode)
(pcase (which-os)
('(win64)
 (progn
   (setq alda-binary-location "E:/alda/alda.exe")
   )
 )
)

;;;###autoload
(require 'evil-collection)
(evil-collection-init)

;;;###autoload
(require 'goto-last-point)

;;;###autoload
(require 'vertico)
(vertico-mode)

(define-key vertico-map (kbd "<escape>") 'minibuffer-keyboard-quit)

;;;###autoload
(require 'orderless)
;;(orderless-mode)
(setq completion-styles '(orderless))

;;;###autoload
(require 'marginalia)
(marginalia-mode)

(require 'corfu)
(corfu-mode)

(setq corfu-auto t)

(setq tab-always-indent 'complete)



(require 'kind-all-the-icons)
(add-to-list 'corfu-margin-formatters 
               #'kind-all-the-icons-margin-formatter)

;;;###autoload
(require 'svg-lib)

;;;###autoload
(require 'svg-tag-mode)

(setq svg-tag-tags
      '((":TODO:" . ((lambda (tag) (svg-tag-make "TODO"))))))

;; (global-hide-mode-line-mode 1)
;;;###autoload
(require 'awesome-tray)
(awesome-tray-mode 1)
(setq
 awesome-tray-active-modules '("mode-name" "location" "buffer-name")
 awesome-tray-mode-line-active-color "White"
 )

(defun tray-module-timer-info ()
  (format "%s" org-timer-mode-line-string)
  )
(defface tray-module-timer-face
'((((background light))
				  :foreground "#00a400" :bold t)
				 (t
				  :foreground "green3" :bold t)
         )
"timer face "
:group 'awesome-tray)
(add-to-list 'awesome-tray-module-alist '("timer" . (tray-module-timer-info tray-module-timer-face)))
(add-to-list 'awesome-tray-active-modules "timer")

;; (global-hide-mode-line-mode 1)
;;;###autoload
;;(require 'tempel)
;;(setq tempel-path (concat config-path "templates"))

;; (global-hide-mode-line-mode 1)
;;;###autoload
(require 'smart-align)

;;(ivy-mode 1)

;;;###autoload
;;(require 'find-file-in-project)
;;(setq ffip-project-root "~/")

;;;###autoload
(require 'exec-path-from-shell)
  (when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;(ivy-mode 1)

;;;###autoload
(require 'color-rg)

;;   ;;;###autoload
;;   (require 'snails)
;;   (setq snails-show-with-frame nil)
;; (add-hook 'snails-mode-hook
;;     (lambda ()
;;       ;;(evil-insert-state)
;;       (evil-emacs-state)
;;       )
;;     )
;; (with-eval-after-load 'snails
;;   (define-key snails-mode-map (kbd "C-n") #'snails-select-next-item)
;;   (define-key snails-mode-map (kbd "C-p") #'snails-select-prev-item)
;;   ;; )

;;(ivy-mode 1)

  ;;;###autoload
  (require 'auto-save)
  (auto-save-enable)
(setq
 auto-save-idle 3
)

(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)
(setq lsp-bridge-python-command "python3")

;;;###autoload
(require 'tempel)
(setq tempel-path (concat config-path "templates"))

(require 'avy)

(require 'ob-d2)

  (pcase (which-os)
    ('(win64)
     (progn
(setq ob-d2-cli-path "c:/Program Files/D2/d2.exe")
       )
     )
    )

;;;###autoload
(require 'slime)
(slime-setup)
(slime-setup '(slime-fancy))
(setq inferior-lisp-program (executable-find "sbcl"))

(require 'imenu-list)

  (setq markdown-imenu-generic-expression
        '(("title"  "^\\(.*\\)[\n]=+$" 1)
          ("h2-"    "^\\(.*\\)[\n]-+$" 1)
          ("h1"   "^# \\(.*\\)$" 1)
          ("h2"   "^## \\(.*\\)$" 1)
          ("h3"   "^### \\(.*\\)$" 1)
          ("h4"   "^#### \\(.*\\)$" 1)
          ("h5"   "^##### \\(.*\\)$" 1)
          ("h6"   "^###### \\(.*\\)$" 1)
          ("h7"   "^- \\(.*\\)$" 1)
          ("fn"   "^\\[\\^\\(.*\\)\\]" 1)))
    (add-hook 'markdown-mode-hook 'imenu-add-menubar-index)

(add-hook 'markdown-mode-hook
          (lambda ()
            (setq imenu-generic-expression markdown-imenu-generic-expression)))
    (setq imenu-auto-rescan t)

(require 'helpful)

;;;###autoload
(require 'polymode)

;;;###autoload
(require 'quarto-mode)
(add-to-list 'auto-mode-alist '("\\.qmd\\'" . poly-quarto-mode))

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist
	     '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))

(require 'flymake-sqlfluff)
(add-hook 'sql-mode-hook #'flymake-sqlfluff-load)

;(require 'flymake-posframe)
;(add-hook 'flymake-mode-hook #'flymake-posframe-mode)

(require 'lilypond-mode)

(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))



;; (require 'cnfonts)
;; ;; 让 cnfonts 在 Emacs 启动时自动生效。
;; (cnfonts-mode 1)
;; ;; 添加两个字号增大缩小的快捷键
;; (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
;; (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)

;; A small minor mode to use a big fringe
;; (defvar bzg-big-fringe-mode nil)
;; (define-minor-mode bzg-big-fringe-mode
;;   "Minor mode to use big fringe in the current buffer."
;;   :init-value nil
;;   :global t
;;   :variable bzg-big-fringe-mode
;;   :group 'editing-basics
;;   (if (not bzg-big-fringe-mode)
;;       (set-fringe-style nil)
;;     (set-fringe-mode
;;      (/ (- (frame-pixel-width)
;;            (* 100 (frame-char-width)))
;;         2))))

;; ;; Now activate this global minor mode
;; (bzg-big-fringe-mode 1)

;; ;; To activate the fringe by default and deactivate it when windows
;; ;; are split vertically, uncomment this:
;;  (add-hook 'window-configuration-change-hook
;;            (lambda ()
;;              (if (delq nil
;;                        (let ((fw (frame-width)))
;;                          (mapcar (lambda(w) (< (window-width w) (/ fw 2)))
;;                                  (window-list))))
;;                  (bzg-big-fringe-mode 0)
;;                (bzg-big-fringe-mode 1))))

;; ;; Use a minimal cursor
;; ;; (setq default-cursor-type 'hbar)

;; ;; Get rid of the indicators in the fringe
;; (mapcar (lambda(fb) (set-fringe-bitmap-face fb 'org-hide))
;;         fringe-bitmaps)

(require 'centered-window)
(setq cwm-centered-window-width 210)
(centered-window-mode t)
(require 'cnfonts)
;; 让 cnfonts 在 Emacs 启动时自动生效。
(cnfonts-mode 1)
;; 添加两个字号增大缩小的快捷键
(define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
(define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)
;; (require 'cnfonts)
;; ;; 让 cnfonts 在 Emacs 启动时自动生效。
;; (cnfonts-mode 1)
;; ;; 添加两个字号增大缩小的快捷键
;; (define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
;; (define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)

;; A small minor mode to use a big fringe
;; (defvar bzg-big-fringe-mode nil)
;; (define-minor-mode bzg-big-fringe-mode
;;   "Minor mode to use big fringe in the current buffer."
;;   :init-value nil
;;   :global t
;;   :variable bzg-big-fringe-mode
;;   :group 'editing-basics
;;   (if (not bzg-big-fringe-mode)
;;       (set-fringe-style nil)
;;     (set-fringe-mode
;;      (/ (- (frame-pixel-width)
;;            (* 100 (frame-char-width)))
;;         2))))

;; ;; Now activate this global minor mode
;; (bzg-big-fringe-mode 1)

;; ;; To activate the fringe by default and deactivate it when windows
;; ;; are split vertically, uncomment this:
;;  (add-hook 'window-configuration-change-hook
;;            (lambda ()
;;              (if (delq nil
;;                        (let ((fw (frame-width)))
;;                          (mapcar (lambda(w) (< (window-width w) (/ fw 2)))
;;                                  (window-list))))
;;                  (bzg-big-fringe-mode 0)
;;                (bzg-big-fringe-mode 1))))

;; ;; Use a minimal cursor
;; ;; (setq default-cursor-type 'hbar)

;; ;; Get rid of the indicators in the fringe
;; (mapcar (lambda(fb) (set-fringe-bitmap-face fb 'org-hide))
;;         fringe-bitmaps)

(require 'centered-window)
(centered-window-mode t)

(require 'org-element)

  (defun p(file) 
    (interactive)
    (setq org-ast
     (with-temp-buffer
  (insert-file-contents file)
  (org-mode)
  ;;(org-element-parse-buffer)

     (org-element-map (org-element-parse-buffer) 'headline
 (lambda (x)
	 (org-element-property :raw-value x)
	 ;;(princ (org-element-property :raw-value x))
	 ;;(terpri )
  ))
  )
     )
    ;;(print org-ast)
    )


  ;;(setq error-package '())


    ;; 错误处理
  ;; (mapc
  ;;  (lambda (x)
  ;;    (condition-case err
  ;;   (package-install x)
  ;;      (error
  ;; (push x error-package)
  ;; )
  ;;  )
  ;;     )
  ;;  (p

  ;;     (concat config-path "+Mode.org")
  ;;     )
  ;;    )
