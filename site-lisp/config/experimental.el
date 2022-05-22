
(require 'org-element)
(require 'dash)

(org-element-parse-buffer
 (org-element-map
     declare
     (cl-defun get()
       (declare (indent defun)
		(-let* ())
       )

(defun tt-plainlist ()
  "2019-01-14"
  (interactive)
  (let ((tt (org-element-parse-buffer 'plain-list )))
    (with-output-to-temp-buffer "*xah temp out*"
      (print tt))))
(org-skip-whitespace
 (package-install 'evil-collection)

 (dolist (package '(evil-collection))
		  ;;(package-installed-p package)
		  (package-install package)
		  )

(defun tt-print-headings ()
  "print all headings in current buffer (of org mode).
2019-01-14"
  (interactive)
  (with-output-to-temp-buffer "*xah temp out*"
    (org-element-map (org-element-parse-buffer) 'headline
      (lambda (x)
        (princ (org-element-property :raw-value x))
        (terpri )))
    ))

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
 (p (concat config-path "+Mode.org"))
(defun add-to-map(keys func)
  "Add a keybinding in evil mode from keys to func."
  (define-key evil-normal-state-map (kbd keys) func)
  (define-key evil-motion-state-map (kbd keys) func))

(add-to-map "<SPC>" nil)

(add-to-map "<SPC>-f-r" 'counsel-recentf)
(add-to-map "<SPC> s" 'save-buffer)
