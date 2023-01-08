;;; -*- lexical-binding: t; -*-

;;;###autoload
        (require 'counsel)
        ;;(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
        ;;(global-set-key (kbd "M-x") 'counsel-M-x)
        ;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
        ;; (global-set-key (kbd "C-s") 'counsel-line)
        ;;(global-set-key (kbd "SPC f r") 'counsel-recentf)
        (global-set-key "\C-s" 'swiper)

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
(define-key evil-normal-state-map (kbd "V") 'evil-visual-block)

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
(setq evil-set-undo-system 'undo-fu)

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

;;;###autoload
  (require 'snails)
  (setq snails-show-with-frame nil)
(add-hook 'snails-mode-hook
	  (lambda ()
	    ;;(evil-insert-state)
	    (evil-emacs-state)
	    )
	  )
(with-eval-after-load 'snails
  (define-key snails-mode-map (kbd "C-n") #'snails-select-next-item)
  (define-key snails-mode-map (kbd "C-p") #'snails-select-prev-item)
  )

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

(require 'cnfonts)
;; 让 cnfonts 在 Emacs 启动时自动生效。
(cnfonts-mode 1)
;; 添加两个字号增大缩小的快捷键
(define-key cnfonts-mode-map (kbd "C--") #'cnfonts-decrease-fontsize)
(define-key cnfonts-mode-map (kbd "C-=") #'cnfonts-increase-fontsize)

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
