;;; -*- lexical-binding: t; -*-

(global-set-key (kbd "C-h") 'delete-backward-char)

(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)
