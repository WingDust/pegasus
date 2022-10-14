;;; -*- lexical-binding: t; -*-

;;;###autoload
    (require 'counsel)
    ;;(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
    ;;(global-set-key (kbd "M-x") 'counsel-M-x)
    ;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
    ;; (global-set-key (kbd "C-s") 'counsel-line)
    ;;(global-set-key (kbd "SPC f r") 'counsel-recentf)
    (global-set-key "\C-s" 'swiper)

  (defun counsel-home()
    (interactive)
    (counsel-fzf nil "~")
    )
(setq counsel-fzf-cmd "fd --type f --hidden --follow --exclude .git --color never '%s'")

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
(define-key evil-insert-state-map (kbd "C-e") 'doom/forward-to-last-non-comment-or-eol)

(define-key evil-insert-state-map (kbd "C-a") 'doom/backward-to-bol-or-indent)

(define-key evil-visual-state-map (kbd "v") 'evil-visual-line)

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

;;;###autoload
;;(require 'alda-mode)
;;(setq alda-binary-location "E:/alda/alda.exe")

;;;###autoload
;;(require 'evil-collection)
;;(evil-collection-init)

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

;;;###autoload
(require 'tempel)
(setq tempel-path (concat config-path "templates"))

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

(require 'flymake-posframe)
(add-hook 'flymake-mode-hook #'flymake-posframe-mode)

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
