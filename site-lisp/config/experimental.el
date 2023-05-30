


(require 's)
(require 'org-element)
(require 'dash)
(require 'cl-lib)

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
(defmacro iter-list (index-var element-var list &rest body)
  (let ((rest (gensym))
        (atag (gensym))
        (btag (gensym)))
    `(cl-flet ((break () (throw (quote ,atag) nil))
               (return (x) (throw (quote ,atag) x))
               (continue () (throw (quote ,btag) nil)))
       (catch (quote ,atag)
         (cl-do* ((,index-var 0 (1+ ,index-var))
                  (,rest ,list (cdr ,rest))
                  (,element-var (car ,rest) (car ,rest)))
             ((null ,rest))
           (catch (quote ,btag)
             ,@body))))))
(progn
  (print 2)
  (print 1)
  )
(princ 2 2 3)

(defun interruptible-pipe (trueChain nilChain groupName)
  "取值 执行 赋值"
  (let* (
    ;; ;; 真值函数-----------------------------------------------取值
    ;; (trueFn  (pop trueChain))
    ;; ;; 执行器-------------------------------------------------待执行
    ;; (executer (lambda (&optional form) (trueFn form)))

    ;; 合并操作--------------------------------------------------执行
    ;; (executer (lambda (&optional form) ((pop trueChain) form)))

    ;; 过程值----------------------------------------------------赋值
    (isInterrupt)
    )
   (iter-list trueIndex trueFn  trueChain
    (setq  isInterrupt (funcall trueFn isInterrupt))
    (if (not (is-empty isInterrupt))
        ;; then
        (progn

          (message "%S" (list trueIndex isInterrupt))
          (continue)
        )
        ;; else
        (progn
          (iter-list nilIndex nilFn nilChain
            (setq  isInterrupt (funcall  nilFn isInterrupt))
            (if (not (is-empty  isInterrupt))
            ;; then
            (progn
            )
                    ;; else
                    (progn
            )

            )

                )
        )


    )

   )
  )
)
(interruptible-pipe
        (list
                '(lambda () (concat "ss")) 
                '(lambda (x) (print x))
        )
        (list
                '(lambda () (concat "ss"))
        )
        "test")

  ;; 有些事还是需要解决的
  ;; 世界不会教你如何面对巨大苦痛佞 却在历史中找到印证，理应享受幸运
  ;; 世界是不会教你如何面对巨大苦痛佞 却在历史中找到印证，理应享受幸运
  ;; 在不看那些歌的情况下被拒绝会是一件好事

;;}}} ==================== End


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
  (let* (isInterrupt)
(loop-for-each trueFn trueChain
  (if (not (is-empty (trueFn  isInterrupt)) )
    ;; then
      (progn

    (print isInterrupt)
    (loop-continue )

    )
    ;; else
    (progn
      (loop-for-each falseFn nilChain
    (if (not (is-empty (falseFn  isInterrupt)) )
        )

       )
     )

    )
 
      )


  ;; (mapc 
  ;;  (lambda (x) (if is-empty(x) (funcall x)) trueChain)

  )
  )
(if '()
(if nil
(if (setq a nil)
(if (cons nil nil)
(when (and 1 1)
(message "1")
(message "2")
        )

(defun interruptible-pipe (trueChain nilChain groupName)
  "取值 执行 赋值"
;; (defun ipipe (trueChain nilChain groupName)
    (let* ((isInterrupt) (trueFn))
        (progn
            (message (concat "================= " groupName))
            (cl-labels
                (
                    (trueExecuter ()
                        (setq trueFn (pop trueChain))
                        (progn 
                          (when trueFn
                                (setq isInterrupt (funcall trueFn isInterrupt))
                (message "%S" isInterrupt)

                                (trueExecuter)
                                )

                        ;; (if (setq isInterrupt (funcall trueFn isInterrupt))
                        ;;         (trueExecuter)
                        ;; )
                        )
                    )
                )
                (progn
                        (trueExecuter)
                )
            )
        )
    )
)
        ;; (ipipe
        (interruptible-pipe
            (list '(lambda (_) "www") '(lambda (x) (concat x "qqq")) '(lambda (x) (message x)))
        (list)
        "t"
        )

        (setq l    (list '(lambda (_) (concat "www" "")) '(lambda (x) (message x))))
       (type-of (func-arity (pop l) ))
  funcall((lambda nil "www") nil)
(documentation #'pop)
(documentation #'calcFunc-arg)
  (let* (
    ;; ;; 真值函数-----------------------------------------------取值
    ;; (trueFn  (pop trueChain))
    ;; ;; 执行器-------------------------------------------------待执行
    ;; (executer (lambda (&optional form) (trueFn form)))

    ;; 合并操作--------------------------------------------------执行
    (executer (lambda (&optional form) ((pop trueChain) form)))

    ;; 过程值----------------------------------------------------赋值
    (isInterrupt)
     )
    (setq isInterrupt (executer))

    )
  

)

(defmacro pipeline (head &rest tail)
  (if tail
      (destructuring-bind ((op &rest args) &rest more) tail
        `(pipeline (,op ,head ,@args) ,@more))
      head))

;;(defun pipeline ()
;;  (let (buffer)
;;    (do ((k 1 (1+ k))) (nil)
;;      (let ((j (/ (* (1+ k) k) 2)))
;;    (if buffer
;;        (let* ((i (pop buffer))
;;           (r (/ (* i j)
;;             (do ((x (max i j) y)
;;                  (y (min i j) (mod x y)))
;;                 ((= 0 y) x)))))
;;          (dolist
;;          (d (do ((x r (floor x 10))
;;              (digits nil (cons (mod x 10) digits)))
;;             ((= 0 x) digits)))
;;        (print d)))
;;        (push j buffer)))
;;      (finish-output)
;;      (sleep 1))))
;;(pipeline)
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
  ;; (+ a form)
  ;; (type-of a)
  (print
  ;; (type-of form)
   form
   )
  )

(one-optional 2 2)
(multi-optional 2  )

;; 一个符号（symbol）不可能既表示一个函数又表示一个宏（macro）
;; 符号与 string 的区别
;; 宏是为生成 lisp 表达式，只不过 lisp 解释器会对这个最后生成的 lisp 表达式进行执行返回结果
(defmacro yymac (a) (list 'list a))
(yymac '22)

(.

(set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "Kaiti SC" :size 18 :weight 'bold))







;;{{{ 列出
 (dolist (font (font-family-list)) (insert (format ";; \"%s\"\n" font)))
;;}}} ==================== End

;;{{{
     
;; Set default font
(set-face-attribute 'default nil
                    :family "Iosevka Fixed Heavy Extended"
                    :height 120
                    :weight 'normal
                    :width 'normal)
;;}}} ==================== End


(set-face-foreground 'markdown-header-delimiter-face "#ff6c6b")

(set-face-foreground 'markdown-header-face-1 "#A3BE8C")
(set-face-foreground 'markdown-header-face-1 "#A3BE8C")
(set-face-foreground 'markdown-header-face-2 "#D08770")
(set-face-foreground 'markdown-header-face-3 "#EBCB8B")
(set-face-foreground 'markdown-header-face-4 "#BF616A")
(set-face-foreground 'markdown-header-face-5 "#B48EAD")

;;{{{
(defun a-latex(begin end)

     ;;  \begin{bmatrix}
     ;;       x \\
     ;;       y 
     ;;  \end{bmatrix}
     ;;     \rightarrow
    
     ;; x\begin{bmatrix}
     ;;       1 \\
     ;;       -2 
     ;;  \end{bmatrix}\
     ;;  +y\begin{bmatrix}
     ;;       3 \\
     ;;       0 
     ;;  \end{bmatrix}
    
     ;;  =\begin{bmatrix}
     ;;       1x+3y \\
     ;;       -2x+0y 
     ;;  \end{bmatrix}

      ;; \begin{bmatrix} x \\ y \end{bmatrix} \rightarrow x\begin{bmatrix} 1 \\ -2 \end{bmatrix}\ +y\begin{bmatrix} 3 \\ 0 \end{bmatrix} =\begin{bmatrix} 1x+3y \\ -2x+0y \end{bmatrix}

  )

;;}}} ==================== End

;;{{{

(custom-set-faces

'(markdown-blockquote-face ((t (:inherit italic :foreground "#83898d" :slant italic))))

;; '(markdown-blockquote-face ((t (:inherit italic :foreground "gray50"))))
 )


(defface markdown-comment-face '(
                 )
  )
(set-face-attribute 'markdown-comment-face nil
                    :family "Iosevka Fixed Heavy Extended"
                    :height 120
                    :weight 'normal
                    :width 'normal)

(set-face-attribute 'italic :Slant italic)

;;}}} ==================== End

(set-fontset-font t '(#x2ff0 . #x9ffc) (font-spec :family "方正楷体简体" :size 18 :weight 'bold))
(set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family "华文楷体" :size 20))
(set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family "STKaiti" :size 20))











世界,请别污染我的语境

英格力士

;;{{{
严肃事对应的是


;;}}} ==================== End

红色砖窗层
;;{{{

(add-hook 'after-save-hook
      (lambda nil (progn
            (message "ss")
            ;; (quarto-mode-markdown-command)
            (markdown-preview)
            )
      )
      )
;;}}} ==================== End

;;{{{

(defun get-org()
  "对一个Org 文件中设有"
  (interactive)
  (let (foo)
    (goto-line 1) ;; 到第一行去
    (save-excursion
      (while (re-search-forward "SCHEDULED" nil t) ;; 会从光标当前行开始正则匹配 SCHEDULED
        ;; <2020-11-19 周四 13:04>
        (setq otitle (org-entry-get (point) "SCHEDULED"))
        ;; 工作
        (setq obody (nth 4 (org-heading-components)))
        ;; TODO keyword
        (setq okeyword (nth 2 (org-heading-components)))
        (setq odate (nth 0 (split-string (string-trim otitle "<" ">"))))
        (setq otime (nth 2 (split-string (string-trim otitle "<" ">"))))
        (unless (equal (format-time-string "%4Y-%2m-%2d" (current-time)) odate) ;; 只有当它的日期与当前计算机日期在同一天才会发出
            (error "日期不在这一天")
            )
        ;; 分解时间字符串来完成时间加减
        (setq num1 (string-to-number (nth 0 (split-string otime ":"))))
        (setq num2 (nth 1 (split-string otime  ":")))
        ;; send the notification
        (if (string-equal "00" num2)
            (if (string-equal "00" (number-to-string num1))
                (setq otime2 "23:59")
              (progn
                (setq num1 (number-to-string (- num1 1)))
                (setq otime2 (concat num1 ":" "59"))
                )
              )
          (setq otime2 (concat (number-to-string num1) ":"  (number-to-string (- (string-to-number num2) 1))))
          )

            (run-at-time otime2 nil (lambda ()
                                      (f-write-text (concat okeyword "\n" obody) 'utf-8
                                                    "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\Record.txt")
                                      ))

            (run-at-time otime nil (lambda ()
                                     ;;(setq alert-id (w32-notification-notify  :title otime :body obody ))
                                     ;;(when alert-id (w32-notification-close alert-id)))
                                     (w32-shell-execute "open"  "E:\\spacemacs\\emacs26-3\\.emacs.d\\site-lisp\\notify\\notify.exe")))
          ))))


;;}}} ==================== End



;;{{{ js indent  parentheses
;; function(s,e,t){
;;     R=eval.bind(0,"Array(n).join(' ')");
;;     for(i=n=0,b=r='';c=t[i++];)
;;         ~s.indexOf(c)
;;         ?(r+=b,b='\n'+R(++n)+c+'\n '+R(++n))
;;         :~e.indexOf(c)
;;         ?b+='\n'+(
;;             (n-=2)?R()+' ':''
;;         )+c+'\n'+
;;         (n?R()+' ':'')
;;     :b+=c;
;;     return r+b;
;; }

;;}}} ==================== End

(setq a (list '(lambda () (message "ss"))))
(iter-list i x a
       (funcall x)

       )
(setq tab-with  2)
(setq-local tab-with  2)
(setq indent-line-function 'insert-tab)

        





;;{{{ Tail Call Optimization
(defun ela/sum (numbers)
  (named-let sum-list ((accu 0)
                       (lst numbers))
    (pcase lst
      (`(,head . ,tail)
       (sum-list (+ accu head) tail))
      (_
       accu))))
(ela/sum (list 1 2 3))
        
;;}}} ==================== End      


;;{{{
        (interruptible-pipe
        (list )
        (list )
        "测试"
        )
;;}}} ==================== End
        lise

;;{{{
(defun mpv-play-url()
(interactive)
(setq a
(eww-links-at-point))
;; [[http://ergoemacs.org/emacs/elisp_list.html][Elisp: List]]
(setq url
(nth 0 a))
;; [[http://ergoemacs.org/emacs/elisp_call_shell_command.html][Elisp: Call Shell Command]]
   ;; (shell-command (concat "mpv " url " --fs"))
   ;; 这个会实时将命令运行输出打印到一个buffer 中
   ;; (w32-shell-execute "mpv" (concat  url " --fs"))
(w32-shell-execute "open" "mpv"
(concat  url " --fs")
0)
)
;; (message (length a))
   ;; 打开一个临时buffer
   ;; (setq xbuff (generate-new-buffer "*my output*"))
   ;; (with-output-to-temp-buffer xbuff
   ;;   ()

   ;;   )
   ;;(message "%S" a)
 
    
;;}}} ==================== End


(s-replace "\[(.*)\]" "22" "[Replace CRLF using powershell](https://stackoverflow.com/questions/19127741/replace-crlf-using-powershell)" )
(replace-string "\[(.*)\]" "222" "[Replace CRLF using powershell](https://stackoverflow.com/questions/19127741/replace-crlf-using-powershell)")
(replace-regexp-in-string "\\[\\(.*\\)\\](\\(h.*\\))" "[[\\2][\\1]]" "[Repllace CRLF using powershell](https)")
              nil 'literal)

(replace-regexp-in-string "\(hello)\(world\)" "\\2\\1" "helloworld")0

(defun r-s (w with in)
  (replace-regexp-in-string (regexp-quote w) with in nil 'literal))
(r-s "." "w" "[wd[()" )

(defun select-current-line ()
    "Select the current line"
    (interactive)
    (let ((pos (line-beginning-position)))
      (end-of-line)
      (set-mark pos)))
(select-current)

(defun r-m()
  (interactive)
  (progn
    (select-current-line)

    (let* (
        (point-start (region-beginning))
        (point-end (region-end))

        )

  (interruptible-pipe (list 
            
        '(lambda (_) (narrow-to-region point-start point-end))
        '(lambda (_) (buffer-string))
        ;; (replace-string-in-region)
        '(lambda (_) (replace-regexp-in-string  "\\[\\(.*\\)\\](\\(h.*\\))" "[[\\2][\\1]]" _))

        '(lambda (_) (progn (kill-region point-start point-end) _))

        ;; '(lambda (_) (concat "\n" _))
        '(lambda (_) (insert _))
        ;; '(lambda (_) (get-mark-content (current-buffer)))
        ;; '(lambda (_) (message "%S" _))


            ) '() "markdown")
    )
    ) 
    
  )

(funcall 'buffer-string)
(buffer-string)
(defun aaa(begin end)
  (interactive "r")
  (message "%S" begin end) 

;; (buffer-string)
  ) 
;; 小程序的: div 换为 view
;;  replace-string div 换为 view => (sgml-pretty-print BEG END) 格式化
(defun replace-div->view ()
  (interactive)
  (let* ((bein-p
          (region-beginning))
         (end-p
          (region-end))
         (new-stri
          (->>
           (get-mark-content (current-buffer))
           (replace-regexp-in-string
            "div" "view")
           (replace-regexp-in-string
            "class=\"[A-Za-z| |0-9|-]+\""
            (lambda (s)
          (message "%S" s )
              ;; (save-match-data
              ;;   (print (concat "替换class: " s))
              ;;   (concat "style=\""
              ;;           (call-clj-get-class-names-styles
              ;;            (replace-regexp-in-string
              ;;             "class=" ""
              ;;             (replace-regexp-in-string "\"" "" s)))
              ;;           "\""))
          )))))
    ;; (progn
    ;;   ;; 1.替换为view的标签名字
    ;;   (kill-region bein-p end-p)
    ;;   (insert new-stri)
    ;;   ;; 2.格式化
    ;;   (sgml-pretty-print bein-p (point)))
    ))

(global-set-key (kbd "C-0") #'get-mark-content)


(get-mark-content)
(setq cc "asd")
;;{{{ 获取当前的选中
;; (defun get-mark-content ()
(defun get-mark-content (buffername)
  ;; (interactive)
  (with-current-buffer
      buffername
      ;; (current-buffer)
       
    (setq cc (buffer-substring-no-properties
     (region-beginning)
     (region-end)))))


;;}}} ==================== End

;;{{{

(defmacro after! (package &rest body)
  "Evaluate BODY after PACKAGE have loaded.
PACKAGE is a symbol (or list of them) referring to Emacs features (aka
packages). PACKAGE may use :or/:any and :and/:all operators. The precise format
is:
- An unquoted package symbol (the name of a package)
    (after! helm BODY...)
- An unquoted, nested list of compound package lists, using any combination of
  :or/:any and :and/:all
    (after! (:or package-a package-b ...)  BODY...)
    (after! (:and package-a package-b ...) BODY...)
    (after! (:and package-a (:or package-b package-c) ...) BODY...)
- An unquoted list of package symbols (i.e. BODY is evaluated once both magit
  and git-gutter have loaded)
    (after! (magit git-gutter) BODY...)
  If :or/:any/:and/:all are omitted, :and/:all are implied.
This emulates `eval-after-load' with a few key differences:
1. No-ops for package that are disabled by the user (via `package!') or not
   installed yet.
2. Supports compound package statements (see :or/:any and :and/:all above).
Since the contents of these blocks will never by byte-compiled, avoid putting
things you want byte-compiled in them! Like function/macro definitions."
  (declare (indent defun) (debug t))
  (if (symbolp package)
      (unless (memq package (bound-and-true-p doom-disabled-packages))
        (list (if (or (not (bound-and-true-p byte-compile-current-file))
                      (require package nil 'noerror))
                  #'progn
                #'with-no-warnings)
              `(with-eval-after-load ',package ,@body)))
    (let ((p (car package)))
      (cond ((memq p '(:or :any))
             (macroexp-progn
              (cl-loop for next in (cdr package)
                       collect `(after! ,next ,@body))))
            ((memq p '(:and :all))
             (dolist (next (reverse (cdr package)) (car body))
               (setq body `((after! ,next ,@body)))))
            (`(after! (:and ,@package) ,@body))))))




;;}}} ==================== End

;;{{{  C-x 1 时不关闭 imenu-list buffer

(buffer-name
(-filter (lambda (buf)
           (and
            (get-buffer-window buf 'visible)
            (not (equal "*Ilist*"   (buffer-name buf)))
            (not (equal (buffer-name (current-buffer)) (buffer-name buf)))

            )
            )
           ;; (message "%S" (get-buffer-window buf 'visible)))
           (buffer-list))

(defun delete-other-buffer-exclude-imenu-list  ()
(->> (buffer-list)
    (-filter
    (lambda (buf)
            (and
                (get-buffer-window buf 'visible)
                (not (equal "*Ilist*"   (buffer-name buf)))
                (not (equal (buffer-name (current-buffer)) (buffer-name buf)))

                )
                )
     )
    (-map
     (lambda (bekill-buf)
       (window-buffer bekill-buf)
     )
     )
    )
  )

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
     (lambda (bekill-buf)
       (delete-window bekill-buf)
     )
     )
    )
  )
(window-list)
(delete-other-windows-exclude-imenu-list)
(delete-window )

(global-set-key (kbd "C-x 1") 'delete-other-windows-exclude-imenu-list)
(global-set-key (kbd "C-x 1") 'delete-other-windows)


(and (equal "sc" (buffer-name (current-buffer))) t)

(interruptible-pipe
 (list
   (lambda () (buffer-list))
   (-filter
    (lambda (buf)
           (message "%S" (get-buffer-window buf 'visible)))
                      )

   )
 (list )
)

(get-buffer-window)
(buf (window-buffer))
;;}}} ==================== End

;;{{{

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



(org-timer-set-mode-line "on")

(message "%S" org-timer-default-timer)
(message "%S" org-timer-mode-line-string)

;;}}} ==================== End

最简版本=> 生成足够范围个数的数字 => 数字 => 字符 => eval

;;{{{


  (setq ob-lilypond-header-args
        '((:results . "file replace")
          (:exports . "results")
          ))
(require 'ob-lilypond)

(defun org-babel-lilypond-process-basic (body params)
  "Execute a lilypond block in basic mode."
  (let* ((out-file (cdr (assq :file params)))
	 (cmdline (or (cdr (assq :cmdline params))
		      ""))
	 (in-file (org-babel-temp-file "lilypond-")))

    (with-temp-file in-file
      (insert (org-babel-expand-body:generic body params)))
;;     (message
;; (concat
;;       org-babel-lilypond-ly-command
;;       " -dbackend=eps "
;;       "-dno-gs-load-fonts "
;;       "-dinclude-eps-fonts "
;;       (or (cdr (assoc (file-name-extension out-file)
;; 		      '(("pdf" . "--pdf ")
;; 			("ps" . "--ps ")
;; 			("svg" . "--svg ")
;; 			("png" . "--png "))))
;; 	  "--png ")
;;       "--output="
;;       (file-name-sans-extension out-file)
;;       " "
;;       cmdline
;;       in-file)
;;      )
    (org-babel-eval
     (concat
      org-babel-lilypond-ly-command
      " -dbackend=eps "
      "-dno-gs-load-fonts "
      "-dinclude-eps-fonts "
      (or (cdr (assoc (file-name-extension out-file)
		      '(("pdf" . "--pdf ")
			("ps" . "--ps ")
			("svg" . "--svg ")
			("png" . "--png "))))
	  "--png ")
      "--output="
      (file-name-sans-extension out-file)
      " "
      cmdline
      in-file) "")
    (message (concat  "java -classpath " resourses-path "MidiPlayer " (file-name-directory buffer-file-name) (concat  (file-name-sans-extension out-file) ".mid")
                   ))

    (start-process-shell-command "play-mid" "mid"
                (concat 
                                  "java"
                   " -classpath " (s-replace "~" "e:/spacemacs/emacs26-3" resourses-path)
                   " MidiPlayer " 
                   (concat (file-name-directory buffer-file-name) (file-name-sans-extension out-file) ".mid")
                   )
                   )
    )

  nil)

    (start-process-shell-command "play-mid" "mid"
                   (concat
                   "java"
                   ;; (concat
                   ;; " -classpath " resourses-path
                   " -classpath " (s-replace "~" "e:/spacemacs/emacs26-3" resourses-path)
                   "  MidiPlayer " 
                   "c:/Users/Administrator/AppData/Local/nvim/images/chords.mid"
                    ;; )
                    )
                   )

    (start-process "play-mid" "mid"
                   "java"
                   ;; (concat
                   ;; " -classpath " resourses-path
                   " -classpath " (s-replace "~" "e:/spacemacs/emacs26-3" resourses-path)
                   "  MidiPlayer " 
                   "c:/Users/Administrator/AppData/Local/nvim/images/chords.mid"
                    ;; )
                   )
    (get-process "play-mid")
 
    (s-replace "~" "e:/spacemacs/emacs26-3" resourses-path)


(defun ba (body params)
  (concat
   org-babel-lilypond-ly-command
    " -dbackend=eps "
      "-dno-gs-load-fonts "
      "-dinclude-eps-fonts "
   
   )

  (-> )
  )

;;}}} ==================== End

(require  'org-super-links)


(expand-file-name
(getenv "DENOTE"))
