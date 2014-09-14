;;; emerald-mode: Major mode for editing Emerald programs

;;; 1: Setup all necessary variables, etc.

(provide 'emerald-mode)

(defvar emerald-mode-map nil
  "Keymap used in Emerald mode.")

(defvar emerald-mode-syntax-table nil
  "Syntax table used in Emerald mode.")

(defvar emerald-mode-abbrev-table nil
  "Abbrev table used in Emerald mode.")

(defvar emerald-auto-newline t
  "Non-nil means newline after automatic termination of a block.")

(defvar emerald-tab-always-indent t
  "Non-nil means TAB in Emerald mode should always reindent the current line
regardless of wher e in the line point is when the TAB command is used.
Otherwise the current line is only indented if point is before the first
non-blank character on the line.")

(defvar emerald-continued-statement-offset 3)

(defvar emerald-block-offset 2)

(defvar emerald-start-of-named-block-regexp
  "\\(\\bobject\\|\\bclass\\b\\|\\btype\\b\\|\\benumeration\\b\\|\\boperation\\b\\|\\bfunction\\b\\|\\bon\\b\\|\\brecord\\b\\|\\bunion\\b\\)[ \t\n]+\\([_0-9a-z]*\\)"
  "Regexp matching the start of a named block in Emerald.")

(defvar emerald-end-of-named-block-regexp
  "\\(end\\)[ \n\t]*\\([_0-9a-z]+\\)"
  "Regexp matching the end of a named block in Emerald.")

(defvar emerald-start-of-endnamed-block-regexp
  "\\(\\)\\(\\bif\\b\\|\\bloop\\b\\|\\bfor\\b\\|\\binitially\\b\\|\\bmonitor\\b\\|\\btransaction\\b\\|\\bprocess\\b\\|\\brecovery\\b\\|\\bunavailable\\b\\|^	* *where\\b\\)"
  "Regexp matching the start of a endnamed keyword block in Emerald.")

(defvar emerald-end-of-endnamed-block-regexp
  "\\(end\\)[ \t\n]*\\(\\bif\\b\\|\\bloop\\b\\|\\bfor\\b\\|\\binitially\\b\\|\\bmonitor\\b\\|\\btransaction\\b\\|\\bprocess\\b\\|\\brecovery\\b\\|\\bunavailable\\b\\|^ *where\\b\\)"
  "Regexp matching the end of a endnamed keyword block in Emerald.")

(defvar emerald-start-of-simple-block-regexp
  "\\(\\bbegin\\b\\)\\(\\)"
  "Regexp matching the beginning of a startnamed keyword block in Emerald.")

(defvar emerald-end-of-simple-block-regexp
  "\\(end\\)\\(\\)"
  "Regexp matching the end of a simple block in Emerald.")

(defvar emerald-block-keyword-regexp
  "\\(\\bobject\\b\\|\\btype\\b\\|\\boperation\\b\\|\\bfunction\\b\\|\\bon\\b\\|\\bif\\b\\|\\bloop\\b\\|\\bfor\\b\\|\\binitially\\b\\|\\bmonitor\\b\\|\\btransaction\\b\\|\\bprocess\\b\\|\\brecovery\\b\\|\\bunavailable\\b\\|^ *where\\b\\|\\bbegin\\b\\|\\benumeration\\b\\|\\brecord\\b\\|\\bunion\\b\\|\\bclass\\b\\|\\bend\\b\\)"
  "Regexp matching the keywords of blocks in Emerald.")

(defvar emerald-end-of-line-regexp
  "^[^\"\n%]*\\(\"[^\"\n]*\"[^\"\n%]*\\)*\\(\\%\\|$\\)"
  "Regexp to find the end of an Emerald-line.")

(defvar emerald-backwards-continued-statement-regexp
  "\\([---[({.,!+=^#>|&/\?~*<@]\\|\\bmove\\|\\bvisit\\|\\bassert\\|\\battached\\|\\bconst\\|\\bwhen\\|\\blocate\\|\\bimmutable\\|\\bisfixed\\|\\bawaiting\\|\\bview\\|\\bas\\|\\brestrict\\|\\bto\\|\\bor\\|\\band\\|\\bnot\\|\\bvar\\|\\bfix\\|\\bat\\|\\bprivate\\|\\bexport\\|\\bprimitive\\|\\brefix\\|\\bsignal\\|\\bunfix\\|\\bwait\\)[ \t]*$"
  "Regexp to test whether the previous line continues on next line.")

(defvar emerald-forwards-continued-statement-regexp
  "^[ \t]*[]---[){}.,!=^#>|&/\?~*<@]"
  "Regexp to test whether a line is continued from the previous line.")

(defvar emerald-alist
  '(( "and" . t)
    ( "assert " . t)
    ( "at " . t)
    ( "attached " . t)
    ( "awaiting " . t)
    ( "begin" . t)
    ( "checkpoint". t)
    ( "const " . t)
    ( "else" . t)
    ( "elseif " . t)
    ( "end" . t)
    ( "enumeration" . t)
    ( "exit" . t)
    ( "export " . t)
    ( "classexport " . t)
    ( "private " . t)
    ( "failure" . t)
    ( "fix " . t)
    ( "for" . t)
    ( "from " . t)
    ( "function " . t)
    ( "if " . t)
    ( "immutable " . t)
    ( "import " . t)
    ( "initially" . t)
    ( "isfixed " . t)
    ( "locate " . t)
    ( "loop" . t)
    ( "monitor" . t)
    ( "move " . t)
    ( "object " . t)
    ( "class " . t)
    ( "on " . t)
    ( "operation " . t)
    ( "or" . t)
    ( "process" . t)
    ( "transaction" . t)
    ( "record " . t)
    ( "recovery" . t)
    ( "refix " . t)
    ( "restrict " . t)
    ( "return" . t)
    ( "returnandfail" . t)
    ( "signal " . t)
    ( "then" . t)
    ( "to " . t)
    ( "type " . t)
    ( "unavailable" . t)
    ( "unfix " . t)
    ( "union " . t)
    ( "var " . t)
    ( "view " . t)
    ( "visit " . t)
    ( "wait " . t)
    ( "when " . t)
    ( "where " . t)
    ( "ownType" . t)
    ( "ownName" . t)
    ( "AbstractType" . t)
    ( "Any" . t)
    ( "Array" . t)
    ( "Boolean" . t)
    ( "Character" . t)
    ( "Condition" . t)
    ( "InStream" . t)
    ( "Integer" . t)
    ( "Node" . t)
    ( "NodeList" . t)
    ( "NodeListElement" . t)
    ( "None" . t)
    ( "OutStream" . t)
    ( "Real" . t)
    ( "Signature" . t)
    ( "String" . t)
    ( "Time" . t)
    ( "Vector" . t)
    ( "false" . t)
    ( "nil" . t)
    ( "self" . t)
    ( "true" . t)
))

;;; 2: Setup all tables needed in a major mode.

(if emerald-mode-map
    nil		       ; Do not change the keymap if it is already set.
  (setq emerald-mode-map (make-sparse-keymap))
  ;;(define-key emerald-mode-map "\C-co" 'emerald-start-object)
  ;;(define-key emerald-mode-map "\C-ci" 'emerald-start-if)
  ;;(define-key emerald-mode-map "\C-ct" 'emerald-start-type)
  ;;(define-key emerald-mode-map "\C-cp" 'emerald-start-operation)
  ;;(define-key emerald-mode-map "\C-cf" 'emerald-start-function)
  ;;(define-key emerald-mode-map "\C-cl" 'emerald-start-loop)
  (define-key emerald-mode-map "\C-ce" 'emerald-terminate-block)
  (define-key emerald-mode-map "\C-cl" 'emerald-list-blocks)
  (define-key emerald-mode-map "\C-c\C-b" 'emerald-backward-block)
  (define-key emerald-mode-map "\C-c\C-f" 'emerald-forward-block)
  (define-key emerald-mode-map "\C-co" 'emerald-out-block)
  (define-key emerald-mode-map "\M-\C-i" 'emerald-complete-name)
  (define-key emerald-mode-map "\C-i" 'emerald-indent-line)
  (define-key emerald-mode-map "\C-c\C-n" 'emerald-indent-all)
  (define-key emerald-mode-map "\177" 'backward-delete-char-untabify)
  )

(if emerald-mode-syntax-table
    nil
  (setq emerald-mode-syntax-table (make-syntax-table (standard-syntax-table)))
  (modify-syntax-entry ?   " "  emerald-mode-syntax-table)
  (modify-syntax-entry ?\t " "  emerald-mode-syntax-table)
  (modify-syntax-entry ?\\ "." emerald-mode-syntax-table)
  (modify-syntax-entry ?\% "<"  emerald-mode-syntax-table)
  (modify-syntax-entry ?\n ">"  emerald-mode-syntax-table)
  (modify-syntax-entry ?\" "\"" emerald-mode-syntax-table)
  (modify-syntax-entry ?'  "\"" emerald-mode-syntax-table)
  (modify-syntax-entry ?\[ "(]" emerald-mode-syntax-table)
  (modify-syntax-entry ?\] ")[" emerald-mode-syntax-table)
  (modify-syntax-entry ?\{ "(}" emerald-mode-syntax-table)
  (modify-syntax-entry ?\} "){" emerald-mode-syntax-table)
  (modify-syntax-entry ?\( "()" emerald-mode-syntax-table)
  (modify-syntax-entry ?\) ")(" emerald-mode-syntax-table)
  (modify-syntax-entry ?$  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?_  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?&  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?*  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?=  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?+  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?-  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?/  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?<  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?>  "_"  emerald-mode-syntax-table)
  (modify-syntax-entry ?|  "_"  emerald-mode-syntax-table)
)

(define-abbrev-table 'emerald-mode-abbrev-table ())

;;; 3: Emerald mode.

(defun emerald-mode ()
  "Major mode for editing Emerald program files.
TAB indents for Emerald code.
Comments are delimited by `%' and the end of the line.
Delete converts tabs to spaces as it moves back.
\\{emerald-mode-map}
Variables controlling indentation style:
 emerald-tab-always-indent
    Non-nil means TAB in Emerald mode should always reindent the current line,
    regardless of where in the line point is when the TAB command is used.
 emerald-auto-newline
    Non-nil means automatically newline after emerald-terminate-block is
    executed.
 emerald-indent-level
    Indentation of Emerald Statements within surrounding block. If the
    beginning of the surrounding block is a continuation of a statement, it
    is treated as extra indentation.
 emerald-continued-statement-offset
    Extra indentation given to the part of a statement that is moved to a
    following line.

Settings for the indentation style used in most Emerald papers:
 emerald-indent-level			3
 emerald-continued-statement-offset	3

Emerald programs usually have a '.m' suffix so consider adding the following
to you setup file:

   (setq auto-mode-alist (cons '(\"\\.m$\" . emerald-mode) auto-mode-alist))

Turning on Emerald mode calls the value of the variable emerald-mode-hook
with no arguments, if that value is non-nil.
"
  (interactive)
  (set-syntax-table emerald-mode-syntax-table)
  (make-local-variable 'indent-line-function)
  (setq indent-line-function 'emerald-indent-line)
  (setq indent-region-function nil)
  (setq comment-start "%")
  (setq comment-start-skip "%+ *")
  (setq comment-end "")
  (setq comment-multi-line nil)
  (setq comment-indent-function 'emerald-comment-indent)
  (setq mode-name "Emerald")
  (setq major-mode 'emerald-mode)
  (use-local-map emerald-mode-map)
  (setq local-abbrev-table emerald-mode-abbrev-table)
  (run-hooks 'text-mode-hook )
  (setq case-fold-search t)
  (run-hooks 'emerald-mode-hook)
)

;;; 4: Other emerald-functions

(defun emerald-terminate-block (count)
  "Terminate COUNT blocks."
  (interactive "p")
  (let* ((save-point (point))
	 (missing-endblocks (emerald-out-block count)))
    (goto-char save-point)
    (if missing-endblocks
	(while missing-endblocks
	  (if (not (looking-back "[ \t\n]"))
	      (insert " "))
	  (insert "end " (cdr (car missing-endblocks)))
	  (save-excursion
	    (beginning-of-line)
	    (emerald-indent-line))
	  (if emerald-auto-newline
	      (newline-and-indent))
	  (setq missing-endblocks (cdr missing-endblocks)))
      (error "No corresponding beginning of block."))))

(defun emerald-out-block (count)
  (interactive "p")
  (nreverse
   (let* ((this-match (emerald-previous-block))
	  (save-point (point))
	  (missing-blocks nil)
	  (block-stack nil))
     (catch 'error-exit
       (while (not (= count 0))
	 (cond
	  ((null this-match)		; all done
	   (throw 'error-exit missing-blocks))
	 
	  ((emerald-found-end-of-block-p) ; end
	   (setq block-stack
		 (cons (emerald-block-name) block-stack)))

	  ;; Found a begin
	  ((null block-stack)		; lonely begin
	   (let ((name (emerald-block-name))
		 (type (emerald-block-type))
		 (save-match-point (match-beginning 0))
		 (prevblocktype (emerald-block-type)))
	     (if (not (string-match "type" type))
		 (while (and prevblocktype
			     (string-match "\\(function\\|operation\\)"
					   prevblocktype))
		   (setq prevblocktype
			 (save-excursion
			   (goto-char save-match-point)
			   (emerald-previous-block)
			   (emerald-block-type)))
		   (setq save-match-point (match-beginning 0))))
	     (if (and (not (string-match "type" type))
		      prevblocktype
		      (string-match "type" prevblocktype))
		 (setq this-match	; lets skip the rest of the decls.
		       (save-excursion
			 (goto-char save-match-point)
			 (re-search-forward 
			  emerald-start-of-named-block-regexp)
			 (point)))
	       (setq missing-blocks
		     (cons (cons type name)
			   missing-blocks))
	       (setq count (1- count)))))

	  ((let ((this-name (emerald-block-name)))
	     (or (string-equal "" this-name)
		 (string-match (car block-stack) this-name)))
	   (setq block-stack (cdr block-stack)))

	  ((let ((name (emerald-block-name))
		 (type (emerald-block-type))
		 (save-match-point (match-beginning 0)))
	     (if (and (string-match "\\(function\\|operation\\)" type)
		      (save-excursion
			(goto-char save-match-point)
			(let ((prevmissingends (emerald-out-block 1)))
			  (if (and (listp prevmissingends)
				   (string-match 
				    "type" 
				    (car (car prevmissingends))))
				t	; we are in a type-definition
			    nil))))
		 t			; like I said: we are in a type-def.
	       (push-mark save-point t)
	       (push-mark this-match t)
	       (error "Block \"%s\" doesn't match \"%s\""
		      name
		      (car block-stack))))))
	 (goto-char this-match)
	 (setq this-match (emerald-previous-block)))
       missing-blocks))))

(defun emerald-list-blocks ()
  (interactive)
  (let ((missing-blocks (save-excursion (emerald-out-block -1)))
	(tmp-string "") start)
    (if (null missing-blocks)
	(message "OK")
      (while missing-blocks
	(setq
	 tmp-string (concat tmp-string "(" (car (car missing-blocks))
			    " " (cdr (car missing-blocks)) ") "))
	(setq
	 missing-blocks (cdr missing-blocks)))
      (if (> 60 (length tmp-string))
	  (message tmp-string)
	(with-output-to-temp-buffer "*Help*"
	  (set-buffer "*Help*")
	  (princ "The following blocks are not terminated properly.\n\n")
	  (setq start (point))
	  (princ tmp-string)
	  (fill-region-as-paragraph start (point) nil))))
    ))

(defun emerald-indent-forward ()
  "Indent line and go to next line"
  (interactive)
  (beginning-of-buffer)
  (while (= 0 (forward-line 1))
    (emerald-indent-line)))

(defun emerald-indent-all1 (endp)
  "Indent line and go to next line"
  (interactive)
  (beginning-of-buffer)
  (while (< (+ (point) 5) endp)
    (forward-line 1)
    (emerald-indent-line)
    ))

(defun emerald-indent-all ()
  "indent all"
  (interactive)
  (end-of-buffer)
  (beginning-of-line)
  (emerald-indent-all1 (point))
  )

(defun emerald-start-Object ()
  "Inserts the string `object ' at point."
  (interactive)
  (insert "object "))

(defun emerald-start-if ()
  "Inserts the string `if ' at point."
  (interactive)
  (insert "if "))

(defun emerald-start-type ()
  "Inserts the string `type ' at point."
  (interactive)
  (insert "type "))

(defun emerald-start-operation ()
  "Inserts the string `operation ' at point."
  (interactive)
  (insert "operation "))

(defun emerald-start-function ()
  "Inserts the string `function ' at point."
  (interactive)
  (insert "function "))

(defun emerald-start-loop ()
  "Inserts the string `loop ' at point."
  (interactive)
  (insert "loop "))

(defun rbc nil
  "recompile"
  (interactive)
  (byte-compile-file "/home/ask1/elgaard/lib/emacs/emerald-mode.el")
  (load-file "/home/ask1/elgaard/lib/emacs/emerald-mode.el")
)

(defun emerald-complete-name ()
  "Completes a name just before point. Possible completions is taken from
Emerald-alist."
  (interactive)
  (let* ((start (save-excursion
		  (skip-chars-backward "_0-9a-zA-Z" (point-min))
		  (point)))
	 (end (point))
	 (name (buffer-substring start end))
	 (completion (if (< 0 (length name))
			 (try-completion name emerald-alist)
		       nil)))
    (cond
     ((eq completion t))
     ((null completion)
      (message "No completion..."))
     ((not (string-equal completion name))
      (delete-region start end)
      (insert completion))
     (t
      (message "Making completion list...")
      (with-output-to-temp-buffer "*Help*"
	(display-completion-list
	 (all-completions name emerald-alist)))
      (message "Making completion list...done")))))

(defun myaref (str inx)
  (if (< (length str) (+ inx 1)) nil
    (aref str inx)))
(defun emerald-indent-line ()
  "Indent current line as Emerald code.
Has a problem with handling strings extending over more that one line."
  (interactive)
  (let* ((thisline (buffer-substring 
		    (save-excursion (beginning-of-line) (point))
		    (save-excursion
		      (beginning-of-line)
		      (re-search-forward emerald-end-of-line-regexp)
		      (if (equal ?% (preceding-char))
			  (backward-char))
		      (point))))
	 (prevline (emerald-previous-nonempty-line 1))
	 (prevprevline (emerald-previous-nonempty-line 2))
	 (indentation (current-indentation)))
    (if (eq (myaref thisline 0) 35 )
	;;(if (string-match "#.*" thisline)
	(delete-horizontal-space)
       (if (equal prevline "")
	   (setq indentation 0)
	 (if (or (string-match emerald-backwards-continued-statement-regexp
			       prevline)
		 (string-match emerald-forwards-continued-statement-regexp
			       thisline))
	     ;; this line is continued from the previous
	     (if (or (string-reverse-match
		      emerald-backwards-continued-statement-regexp
		      prevprevline)
		     (string-match emerald-forwards-continued-statement-regexp
				   prevline))
		 (setq indentation     ;;; prevprevline was also continued
		       (string-get-indentation prevline))
	       (setq indentation
		     (+ emerald-continued-statement-offset
			(string-get-indentation prevline))))
	   (if (or (string-match emerald-backwards-continued-statement-regexp
				 prevprevline)
		   (string-match emerald-forwards-continued-statement-regexp
				 prevline))
	       ;; previous line was continued, this one is not
	       (setq indentation
		     (- (string-get-indentation prevline)
			emerald-continued-statement-offset))
	     (setq indentation (string-get-indentation prevline)))))
       (setq indentation
	     (+ indentation
		(* emerald-block-offset
		   (- (emerald-get-number-of-block-starts prevline)
		      (emerald-get-number-of-block-ends thisline)))))
       (if (not (equal indentation (current-indentation)))
	   (if (looking-back "^[ \t]*")
	       (progn
		 (delete-horizontal-space)
		 (indent-to indentation)
		 (skip-chars-forward " \t"))
	     (if emerald-tab-always-indent
		 (save-excursion
		   (beginning-of-line)
		   (delete-horizontal-space)
		   (indent-to indentation))))
	 (if (looking-back "^[ \t]*")
	     (skip-chars-forward " \t")))
       )
      )
    )
  
(defun emerald-comment-indent ()
  (emerald-indent-line)
  (insert "comment-indent is called")
  (current-indentation))

(defun emerald-forward-block (count) 
  "Move point an Emerald block forwards. If point is not at the start of
a block, move point forward to the nearest block."
  (interactive "p")
)

(defun emerald-backward-block (count)
  "Move point an Emerald block backwards. If point is not at the end of
a block move point back to the nearest block."
  (interactive "p")
  (while (< 0 count)
    (skip-chars-backward " \t\n")
    (if (not (or (looking-back emerald-end-of-simple-block-regexp)
		 (looking-back emerald-end-of-endnamed-block-regexp)
		 (looking-back emerald-end-of-named-block-regexp)))
	(re-search-backward emerald-block-keyword-regexp)
      (let* ((this-match (emerald-previous-block))
	     (save-point (point))
	     (block-stack nil))
	(catch 'easy-exit
	  (while t
	    (cond
	     ((null this-match)		; no more blocks to be found
	      (error "No corresponing beginning of block."))

	     ((emerald-found-end-of-block-p) ; end
	      (setq block-stack (cons (emerald-block-name) block-stack)))

	     ;; Found a begin
	     ((null block-stack)	; In a type - else an error
	      (let ((name (emerald-block-name))
		    (type (emerald-block-type))
		    (save-match-point (match-beginning 0))
		    (prevblocktype (emerald-block-type)))
		(if (not (string-match "type" type))
		    (while (and prevblocktype
				(string-match "\\(function\\|operation\\)"
					      prevblocktype))
		      (setq prevblocktype
			    (save-excursion
			      (goto-char save-match-point)
			      (emerald-previous-block)
			      (emerald-block-type)))
		      (setq save-match-point (match-beginning 0))))
		(if (and (not (string-match "type" type))
			 prevblocktype
			 (string-match "type" prevblocktype))
		    nil
		  (error "I think I've messed up. Try your luck."))))

	     ((let ((this-name (emerald-block-name)))
		(or (string-equal "" this-name)
		    (string-match (car block-stack) this-name)))
	      (setq block-stack (cdr block-stack))
	      (if (null block-stack)
		  (throw 'easy-exit t)))

	     ((let ((name (emerald-block-name))
		    (type (emerald-block-type))
		    (save-match-point (match-beginning 0)))
		(if (and (string-match "\\(function\\|operation\\)" type)
			 (save-excursion
			   (goto-char save-match-point)
			   (let ((prevmissingends (emerald-out-block 1)))
			     (and (listp prevmissingends)
				  (string-match 
				   "type" 
				   (car (car prevmissingends)))))))
		    nil			; we are in a type-definition
		  (push-mark save-point t)
		  (push-mark this-match t)
		  (error "Block \"%s\" doesn't match \"%s\""
			 name
			 (car block-stack))))))
	    (goto-char this-match)
	    (setq this-match (emerald-previous-block))))
	(goto-char this-match)))
    (setq count (1- count))))

;;; 5: Miscellaneous aiding functions

(defun emerald-block-name ()
  (buffer-substring (match-beginning 2) (match-end 2)))

(defun emerald-block-type ()
  (buffer-substring (match-beginning 1) (match-end 1)))

(defun emerald-found-end-of-block-p ()
  (let ((this-word (buffer-substring (match-beginning 1) (match-end 1))))
    (equal "end" this-word)))

(defun emerald-previous-block ()
  (save-excursion
    (if (re-search-backward emerald-block-keyword-regexp nil t )
	(let ((this-word 
	       (concat " "
		       (buffer-substring (match-beginning 0) (match-end 0))
		       " "))
	      (curlinetohere (buffer-substring (save-excursion
						 (beginning-of-line)
						 (point))
					       (point))))
	  (cond
	   ((string-match
	     "\""
	     (emerald-remove-strings curlinetohere))
	    (emerald-previous-block))
	   ((string-match 
	     this-word
	     " object class type operation function on record union ")
	    (re-search-forward emerald-start-of-named-block-regexp))
	   ((string-match
	     this-word
	     " if loop for initially monitor process transaction recovery unavailable where ")
	    (if (looking-back "\\bend[ \t\n]*")
		(progn
		  (re-search-forward emerald-block-keyword-regexp)
		  (re-search-backward emerald-end-of-endnamed-block-regexp))
	      (re-search-forward emerald-start-of-endnamed-block-regexp)))
	   ((string-match
	     this-word
	     " begin enumeration ")
	    (re-search-forward emerald-start-of-simple-block-regexp))
	   ((string-match this-word " end ")
	    (if (save-excursion
		  (looking-at "[ \t\n]*[_0-9a-z]+"))
		(re-search-forward emerald-end-of-named-block-regexp)
	        (re-search-forward emerald-end-of-simple-block-regexp)))
	   (t
 ;;;	    (error "We are never supposed to get here.")))
	    nil)
	   )
	  (match-beginning 0))
      nil))) ;;; nil
 
(defun emerald-following-block ()
  (save-excursion
    (if (re-search-forward emerald-block-keyword-regexp nil t )
	(let ((this-word (concat " "
			         (buffer-substring (match-beginning 0)
						   (match-end 0))
				 " ")))
	  (cond
	   ((string-match 
	     this-word
	     " object class type operation function on record union ")
	    (re-search-backward emerald-start-of-named-block-regexp))
	   ((string-match
	     this-word
	     " if loop for initially monitor process transaction recovery unavailable where ")
	      (re-search-backward emerald-block-keyword-regexp)
	      (if (looking-back "\\bend[ \t\n]*")
		  (progn
		    (re-search-forward emerald-block-keyword-regexp)
		    (re-search-backward emerald-end-of-endnamed-block-regexp))
		(re-search-forward emerald-start-of-endnamed-block-regexp)))
	   ((string-match
	     this-word
	     " begin enumeration ")
	    (re-search-backward emerald-start-of-simple-block-regexp))
	   ((string-match this-word " end ")
	    (if (save-excursion
		  (looking-at "[ \t\n]*[_0-9a-z]+"))
		(progn
		  (search-backward "end")
		  (re-search-forward emerald-end-of-named-block-regexp))
	        (progn
		  (search-backward "end")
		  (re-search-forward emerald-end-of-simple-block-regexp))))
	   (t
	    (error "We are never supposed to get here.")))
	  (match-end 0))
      nil)))

(defun emerald-previous-nonempty-line (count)
(interactive "p")
  (let* ((newcount count)
	 (result ""))
    (save-excursion
      (while (< 0 newcount)
	(let* ((testbeg (progn (forward-line -1) (beginning-of-line) (point)))
	       (testend
		(progn
		  (re-search-forward emerald-end-of-line-regexp)
		  (if (equal ?% (preceding-char))
		      (backward-char))
		  (point)))
	       (testline (buffer-substring testbeg testend)))
	  (if (or (and (string-match "[^ \t\n]" testline) 
		       (not (eq (myaref testline 0) 35 )))  
		  ;; do not indent CPP directives
		  (progn (beginning-of-line) (bobp)))
	      (setq newcount (1- newcount)))
	  (setq result testline))))
    (if (bobp)
	""
      result
      )
    )
)

(defun emerald-remove-strings (string)
  (let ((tempstring string))
    (while (string-match "\"[^\"]*\"" tempstring)
      (setq tempstring
	    (concat (substring tempstring 0 (match-beginning 0))
		    (substring tempstring (match-end 0)))))
    tempstring))

(defun emerald-get-number-of-block-starts (line)
  (let ((cleanline (emerald-remove-strings line)))
    (if (and (string-match "\\(\\bfunction\\b\\|\\b\\operation\\b\\)"
			   cleanline)
	     (let ((prevblock (save-excursion (emerald-out-block 1))))
	       (and prevblock
		    (string-match "type" (car (car prevblock))))))
	0
      (+ (+ (string-how-many emerald-start-of-simple-block-regexp cleanline)
	    (- (string-how-many emerald-start-of-endnamed-block-regexp
				cleanline)
	       (string-how-many emerald-end-of-endnamed-block-regexp
				cleanline)))
	 (+ (string-how-many emerald-start-of-named-block-regexp cleanline)
	    (string-how-many "\\(\\belseif\\b\\|\\belse\\b\\)" cleanline))))))

(defun emerald-get-number-of-block-ends (line)
  (let ((cleanline (emerald-remove-strings line)))
    (+ (string-how-many "\\bend\\b" cleanline)
       (if (string-match "^[ \t]*\\(elseif\\b\\|else\\b\\)" cleanline)
	   (string-how-many "\\(\\belseif\\b\\|\\belse\\b\\)" cleanline)
	 0))))

;;; 6: Miscellaneous general functions

(defun string-how-many (regexp string)
  "Return number of matches for REGEXP in STRING."
  (let ((count 0) 
	(opoint -1)
	(npoint 0))
    (while (setq npoint (string-match regexp string npoint))
      (if (= opoint npoint)
	  (setq npoint (1+ npoint))
	(setq count (1+ count)))
      (setq opoint npoint))
    count))

(defun string-get-indentation (String)
  "Computes the indentation of the given string."
  (let ((temp 0)
	(offset 0)
	(char nil)
	(limit (length String)))
    (if (< 0 limit)
	(progn
	  (setq char (substring String 0 1))
	  (while (and (or (equal char " ") (equal char "\t"))
		      (< offset limit))
	    (if (equal char " ")
		(setq temp (1+ temp))
	      (setq temp (- (+ temp tab-width)
			    (% temp tab-width))))
	    (setq offset (1+ offset))
	    (if (< offset limit)
		(setq char (substring String offset (1+ offset)))))))
    temp))

(defun string-reverse-match (regexp string)
  "Simulates a string-match, but works backwards from the end of the string"
  (let ((stringlength (length string))
	(offset 0)
	(notfound t))
    (while (and notfound (<= offset stringlength))
      (if (string-match regexp string offset)
	  (progn
	    (setq offset (match-beginning 0))
	    (if (= stringlength
		   (match-end 0))
		(setq notfound nil)
	      (setq offset (1+ (match-beginning 0)))))
	(setq notfound nil)))
    (string-match regexp string offset)))

(defun looking-back (regexp)
  "Simulates a looking-at, but works backwards"
  (and (save-excursion
	 (re-search-backward regexp (min (point-min) (- (point) 100)) t))
       (= (point) (match-end 0))))


; font-lock
(require 'font-lock)
(setq font-lock-keywords-case-fold-search t)

(defconst emerald-font-lock-keywords (purecopy
  (list
   '("\\<\\(end\\|function\\|operation\\|on\\)\\>[ \t]*\\(\\S-*\\)?"  1 font-lock-keyword-face)
   '("\\<\\(end\\|function\\|operation\\|on\\)\\>[ \t]*\\([^ 		\n]*\\)?"  2 font-lock-function-name-face t)

   '("[ \t]*\\<\\(enumeration\\|type\\|record\\|object\\|class\\)\\>[ \t]*\\(\\sw*\\)?"  1 font-lock-keyword-face)
   '("[ \t]*\\<\\(enumeration\\|type\\|record\\|object\\|class\\)\\>[ \t]*\\(\\S-*\\)?"  2 font-lock-function-name-face t)
   '("[ \t]*\\(\\(export[ \t]+\\)?end\\|initially\\|monitor\\)\\>"  . font-lock-function-name-face)
   (cons "\\<\\(array\\|boolean\\|c\\(har\\|onst\\|ondition\\)\\|file\\|integer\\|immutable\\|real\\|string\\|time\\|v\\(ar\\|ector\\)\\)\\>"
	 'font-lock-type-face)
   '("\\<\\(exportl\\|import\\)\\>" . font-lock-preprocessor-face)

   (concat "\\<\\(a\\(nd\\|ttached\\)\\|begin\\|case\\\|e\\(lse\\(if\\)?\\|nd\\|xit\\)\\|for\\|i[fn]\\|loop\\|move\\|"
	   "not\\|o[fr]\\|t\\(hen\\|o\\)\\|w\\(hile\\|hen\\|ith\\)\\)\\>")
   )
  )
  "Additional expressions to highlight in Emerald mode.")

(put 'emerald-mode 'font-lock-keywords-case-fold-search t)
