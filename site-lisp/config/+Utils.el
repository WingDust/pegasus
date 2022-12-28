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
;;(filter-path "~/pegasus/" '("+Setting.org" "+Keybinding.org"))
(filter-path config-path '("+Setting.org" "+Keybinding.org"))

(defun js2json ()
  (interactive)
  (shell-command-on-region (region-beginning)
                           (region-end)
                           "node -e 'console.log(JSON.stringify(eval(require(\"fs\").readFileSync(0, \"utf-8\"))))'"
                           (current-buffer)
                           t))

(defun delete-other-windows-exclude-imenu-list  ()
  (interactive)
(->> (window-list)
    (-filter
    (lambda (win)
            (and
                (not (equal "*Ilist*" (buffer-name (window-buffer win))))
                (not (eq  (selected-window)  win))

                )
                )
     )
    (-map
     (lambda (bekill-win)
       (delete-window bekill-win)
     )
     )
    )
)

  (global-set-key (kbd "C-x 1") 'delete-other-windows-exclude-imenu-list)
