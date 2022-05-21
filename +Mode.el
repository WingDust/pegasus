;;; -*- lexical-binding: t; -*-

;;;###autoload
(require 'counsel)
;;(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
;;(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
;; (global-set-key (kbd "C-s") 'counsel-line)
(global-set-key "\C-s" 'swiper)



;;;###autoload
(require 'evil)
(evil-mode)
;; (setq-default evil-disable-insert-state-bindings t)
;; (define-key evil-insert-state-map (kbd "C-a") 'evil-beginning-of-line)
(define-key evil-insert-state-map (kbd "C-e") 'doom/forward-to-last-non-comment-or-eol)

(define-key evil-insert-state-map (kbd "C-a") 'doom/backward-to-bol-or-indent)

(define-key evil-visual-state-map (kbd "v") 'evil-visual-line)

;;;###autoload
(require 'evil-matchit)

(global-evil-matchit-mode 1)

(evil-define-key 'normal 'global (kbd "<tab>")  'evil-jump-item)

;;;###autoload
(require 'alda-mode)
(setq alda-binary-location "E:/alda/alda.exe")

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

;;;###autoload
(require 'corfu)
(corfu-global-mode)

(setq corfu-auto t)

(setq tab-always-indent 'complete)

;;;###autoload
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
(require 'awesome-tray)
(awesome-tray-mode 1)
(setq
 awesome-tray-active-modules '("mode-name" "location" "buffer-name")
 awesome-tray-mode-line-active-color "White"
 )
