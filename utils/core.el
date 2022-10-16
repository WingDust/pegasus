
(require 'org)
(require 'ob-tangle)

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
