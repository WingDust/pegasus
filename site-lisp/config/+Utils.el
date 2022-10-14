(defun org-file-extension-to-elisp-file-extension (file-name)
        (concat
        (file-name-sans-extension file-name) ".el")
)
;;(org-file-extension-to-elisp-file-extension "H:/Work/framework/Key.org")

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

;;(filter-path "H:/Work/framework/" '("+Setting.org" "+Keybinding.org"))
(filter-path "~/elegant/" '("+Setting.org" "+Keybinding.org"))
