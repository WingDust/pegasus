



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


(setq error-package '())


;; 错误处理
(mapc
 (lambda (x)
   (condition-case err
	(package-install x)
     (error
      (push x error-package)
      )
       )
    )
 (p

  (concat config-path "+Mode.org")
  )
 )
(defmacro safe-wrap (fn &rest clean-up)
  `(unwind-protect
       (let (retval)
         (condition-case ex
             (setq retval (progn ,fn))
           ('error
            (message (format "Caught exception: [%s]" ex))
            (setq retval (cons 'exception (list ex)))))
         retval)
     ,@clean-up))
(safe-wrap (error "Hello") (message "Unwinding..."))
(safe-wrap (/ 1 0)



   (condition-case err

       (message "sss")
	;;(package-install 'asdasdasd)
     (error
     ; "%s" err
      (push  "asdasdasd" error-package )
      )
       )

   (package-install 'evil)
(unwind-protect
    (error "hello")
  (insert "hi"))

(setq baz 34)
     ⇒ 34

(condition-case err
    (if (eq baz 35)
        t
      ;; This is a call to the function error.
      ;;(error "Rats!  The variable %s was %s, not 35" 'baz baz)
      )
  
  (progn
    )
  
  ;; This is the handler; it is not a form.
  ;;(error (princ (format "The error was: %s" err))
  ;;       2)
  )


;;{{{

 (defun  is-linux ()
  "判断是否是 linux 系统，是返回 '(linux) 否返回 nil"
  (if (or (eq system-type 'gnu/linux) (eq system-type 'linux))
      '(linux)
      )
	)
(is-linux)
(defun is-win64 ()
  (if (eq system-type 'windows-nt)
      '(win64)
      )
	)
(is-win64)

(defun is-mac ()
  (if (eq system-type 'darwin)
      '(mac)
      )
	)
(is-mac)

(defun which-os()
  (--find 
   (not (eq nil it))

   (list (is-linux) (is-win64) (is-mac))
   )
  )

(equal (which-os) '(mac))

(pcase (which-os)
  ('(mac) (message "fail"))
  )

;;}}}
(functionp 'which-os)
(functionp '-)
(type-of #'-)

(funcall 'which-os)
;;{{{

(defun is-empty(uknown)
  
  (pcase uknown
    ('nil t)
    )
  )
(is-empty 1)
(is-empty nil)
(is-empty '())

(defun interruptible-pipe (trueChain,nilChain,groupName)
  (mapc 
   (lambda (x)
     (if is-empty(x)
     (funcall x)
     )
   trueChain
   )

  )
;;}}}

  (defun is-a-fun()
(message "fun")
(message "fun")
    )
  (message "%S" (symbol-function 'is-a-fun))

  group
  ;; 我第一个加载的是目录结构定义配置
  ;; 基础原生调整
  ;; 工具方法，分自己写的，抄的
  ;; 外部依赖 font terminal 工具
  ;; 主题属于配置
  ;; dash 为核心配置
 ;; （define-m

;;{{{
  (fixnump 2)
;;}}} ==================== End
;;{{{ 所有的单词与字符间添加空格
  (fixnump 2)
;;}}} ==================== End

;;{{{ nvim 实现 当前空格之前 toggle 单引号，双引号
  
;;}}} ==================== End

;;{{{ todo 写一个函数替换当前选择区域中所有空格为单个空格
  
;;}}} ==================== End

(defmacro -> (x &optional form &rest more)
  "Thread the expr through the forms. Insert X as the second item
in the first form, making a list of it if it is not a list
already. If there are more forms, insert the first form as the
second item in second form, etc."
  (declare (debug (form &rest [&or symbolp (sexp &rest form)])))
  (cond
   ((null form) x)
   ((null more) (if (listp form)
		    ;;整体被 `
                    `(,(car form) ,x ,@(cdr form))
                  (list form x)))
   (:else `(-> (-> ,x ,form) ,@more))))

(-> (message ))

(null nil)

;; 一个可选参数
(defun one-optional(a &optional form)
  (+ a form)
  )
;; 多个可选参数
(defun multi-optional(a &optional form)
  (+ a form)
  )

(one-optional 2 2)

;; 一个符号（symbol）不可能既表示一个函数又表示一个宏（macro）
;; 符号与 string 的区别
;; 宏是为生成 lisp 表达式，只不过 lisp 解释器会对这个最后生成的 lisp 表达式进行执行返回结果
(defmacro yymac (a) (list 'list a))
(yymac '22)

(.

(set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Kaiti SC" :size 18 :weight 'bold))






