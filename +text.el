;;; +text.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "text" "text.el" (25204 18311 0 0))
;;; Generated autoloads from text.el

(defvar doom-point-in-comment-functions nil "\
List of functions to run to determine if point is in a comment.

Each function takes one argument: the position of the point. Stops on the first
function to return non-nil. Used by `doom-point-in-comment-p'.")

(defvar doom-point-in-string-functions nil "\
List of functions to run to determine if point is in a string.

Each function takes one argument: the position of the point. Stops on the first
function to return non-nil. Used by `doom-point-in-string-p'.")

(autoload 'doom-surrounded-p "text" "\
Returns t if point is surrounded by a brace delimiter: {[(

If INLINE is non-nil, only returns t if braces are on the same line, and
whitespace is balanced on either side of the cursor.

If INLINE is nil, returns t if the opening and closing braces are on adjacent
lines, above and below, with only whitespace in between.

\(fn PAIR &optional INLINE BALANCED)" nil nil)

(autoload 'doom-point-in-comment-p "text" "\
Return non-nil if POS is in a comment.
POS defaults to the current position.

\(fn &optional POS)" nil nil)

(autoload 'doom-point-in-string-p "text" "\
Return non-nil if POS is in a string.

\(fn &optional POS)" nil nil)

(autoload 'doom-point-in-string-or-comment-p "text" "\
Return non-nil if POS is in a string or comment.

\(fn &optional POS)" nil nil)

(autoload 'doom-region-active-p "text" "\
Return non-nil if selection is active.
Detects evil visual mode as well." nil nil)

(function-put 'doom-region-active-p 'side-effect-free 't)

(autoload 'doom-region-beginning "text" "\
Return beginning position of selection.
Uses `evil-visual-beginning' if available." nil nil)

(function-put 'doom-region-beginning 'side-effect-free 't)

(autoload 'doom-region-end "text" "\
Return end position of selection.
Uses `evil-visual-end' if available." nil nil)

(function-put 'doom-region-end 'side-effect-free 't)

(autoload 'doom-thing-at-point-or-region "text" "\
Grab the current selection, THING at point, or xref identifier at point.

Returns THING if it is a string. Otherwise, if nothing is found at point and
PROMPT is non-nil, prompt for a string (if PROMPT is a string it'll be used as
the prompting string). Returns nil if all else fails.

NOTE: Don't use THING for grabbing symbol-at-point. The xref fallback is smarter
in some cases.

\(fn &optional THING PROMPT)" nil nil)

(function-put 'doom-thing-at-point-or-region 'side-effect-free 't)

(autoload 'doom/backward-to-bol-or-indent "text" "\
Jump between the indentation column (first non-whitespace character) and the
beginning of the line. The opposite of
`doom/forward-to-last-non-comment-or-eol'.

\(fn &optional POINT)" t nil)

(autoload 'doom/forward-to-last-non-comment-or-eol "text" "\
Jumps between the last non-blank, non-comment character in the line and the
true end of the line. The opposite of `doom/backward-to-bol-or-indent'.

\(fn &optional POINT)" t nil)

(autoload 'doom/backward-kill-to-bol-and-indent "text" "\
Kill line to the first non-blank character. If invoked again afterwards, kill
line to beginning of line. Same as `evil-delete-back-to-indentation'." t nil)

(autoload 'doom/delete-backward-word "text" "\
Like `backward-kill-word', but doesn't affect the kill-ring.

\(fn ARG)" t nil)

(autoload 'doom/dumb-indent "text" "\
Inserts a tab character (or spaces x tab-width)." t nil)

(autoload 'doom/dumb-dedent "text" "\
Dedents the current line." t nil)

(autoload 'doom/retab "text" "\
Converts tabs-to-spaces or spaces-to-tabs within BEG and END (defaults to
buffer start and end, to make indentation consistent. Which it does depends on
the value of `indent-tab-mode'.

If ARG (universal argument) is non-nil, retab the current buffer using the
opposite indentation style.

\(fn ARG &optional BEG END)" t nil)

(autoload 'doom/delete-trailing-newlines "text" "\
Trim trailing newlines.

Respects `require-final-newline'." t nil)

(autoload 'doom/dos2unix "text" "\
Convert the current buffer to a Unix file encoding." t nil)

(autoload 'doom/unix2dos "text" "\
Convert the current buffer to a DOS file encoding." t nil)

(autoload 'doom/toggle-indent-style "text" "\
Switch between tabs and spaces indentation style in the current buffer." t nil)

(autoload 'doom/set-indent-width "text" "\
Change the indentation size to WIDTH of the current buffer.

The effectiveness of this command is significantly improved if you have
editorconfig or dtrt-indent installed.

\(fn WIDTH)" t nil)

(autoload 'doom-enable-delete-trailing-whitespace-h "text" "\
Enables the automatic deletion of trailing whitespaces upon file save.

i.e. enables `ws-butler-mode' in the current buffer." nil nil)

(autoload 'doom-disable-delete-trailing-whitespace-h "text" "\
Disables the automatic deletion of trailing whitespaces upon file save.

i.e. disables `ws-butler-mode' in the current buffer." nil nil)

(autoload 'doom-enable-show-trailing-whitespace-h "text" "\
Enable `show-trailing-whitespace' in the current buffer." nil nil)

(autoload 'doom-disable-show-trailing-whitespace-h "text" "\
Disable `show-trailing-whitespace' in the current buffer." nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "text" '("doom--")))

;;;***

(provide '+text)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; +text.el ends here
