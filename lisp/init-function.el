;; -*- Emacs-Lisp -*-

;; Time-stamp: <2013-06-15 09:02:10 bichongl>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.


;;; Commentary:
;; 

;;; Code:

(when (>= 21 emacs-major-version)
  (defalias 'move-beginning-of-line 'beginning-of-line)
  (defalias 'move-end-of-line       'end-of-line))

;;;###autoload
(defun am-add-hooks (hooks function &optional append local)
  "Call `add-hook' on hook list HOOKS use arguments FUNCTION, APPEND, LOCAL.

HOOKS can be one list or just a hook."
  (if (listp hooks)
      (mapc
       `(lambda (hook)
          (add-hook hook ',function append local))
       hooks)
    (add-hook hooks function append local)))

;;;###autoload
(defun am-intern (&rest strings)
  "`intern' use STRINGS."
  (intern
   (apply
    'concat
    (mapcar
     (lambda (element)
       (if (stringp element) element (symbol-name element)))
     strings))))

;;;###autoload
(defun am-variable-is-t (symbol)
  "Return SYMBOL's value is t or not."
  (and (boundp symbol) (symbol-value symbol)))

;;;###autoload
(defmacro am-def-active-fun (symbol &optional fun-name)
  "Make definition of function judge variable is active or not."
  `(defun ,(if fun-name fun-name symbol) ()
     ,(concat "`" (symbol-name symbol) "' is t or not.")
     (am-variable-is-t ',symbol)))

;;;###autoload
(defun am-forward-word-or-to-word ()
  "`forward-word' or `forward-to-word'.
If after excute `forward-to-word', current position
is at next line, then rollback and excute `forward-word'"
  (interactive)
  (let ((noo (line-number-at-pos)) no)
    (save-excursion
      (forward-to-word 1)
      (setq no (line-number-at-pos)))
    (if (> no noo)
        (forward-word)
      (forward-to-word 1))))

;;;###autoload
(defmacro am-with-temp-mode (mode &rest body)
  "Create a temporary buffer with mode MODE, and evaluate BODY there like `progn'.
See also `with-temp-buffer'."
  `(with-temp-buffer
     (funcall ,mode)
     ,@body))

;;;###autoload
(defun am-equal-ignore-case (str1 str2)
  "STR1 equal ignore case to STR2 or not."
  (string= (downcase str1) (downcase str2)))
  
(defun bc-kill-whole-line ()
  (interactive)
  (beginning-of-line)
  (kill-line))

(defun pop-line (&optional n)
  "Pop current line N (1) lines up/down leaving point in place."
  (interactive "p")
  (when (null n)
    (setq n 1))
  (let ((col (current-column)))
    (beginning-of-line)
    (forward-line 1)
    (transpose-lines n)
    (previous-line 1)
    (forward-char col)))

(defun pop-line-up (n)
  "Pops current line N (1) lines up leaving point in place."
  (interactive "p")
  (pop-line (if (null n) -1 (- n))))

(defun pop-line-down (n)
  "Pops current line N (1) lines down leaving point in place."
  (interactive "p")
  (pop-line (if (null n) 1 n)))

(defun comment-and-go-down ()
  "Comments the current line and goes to the next one"
  (interactive)
  (condition-case nil (comment-region (point-at-bol) (point-at-eol)) (error nil))
  (forward-line 1))

(defun uncomment-and-go-up ()
  "Uncomments the current line and goes to the previous one"
  (interactive)
  (condition-case nil (uncomment-region (point-at-bol) (point-at-eol)) (error nil))
  (forward-line -1))

(defun bc-tidy-buffer ()
  "Make lisp code neat."
  (interactive "*")
  (save-excursion
    (unless (memq major-mode '(makefile-mode))
      (indent-region (point-min) (point-max) nil)
      )))

(defun dos2unix ()
  "dos2unix on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'unix))

(defun unix2dos ()
  "unix2dos on current buffer."
  (interactive)
  (set-buffer-file-coding-system 'dos))

(defun lbc-c-open-other-file ()
  "if current file is a header file, then open the
   corresponding source file or vice versa.
"
  (interactive)
  (let ((f (buffer-file-name))
        (headers '("h" "hpp" "hxx"))
        (sources '("c" "cxx" "cpp" "cc")))
    (if f
        (let* ((b (file-name-sans-extension f))
               (x (file-name-extension f))
               (s (cond
                   ((member x headers) sources)
                   ((member x sources) headers)
                   (t nil)))
               (return-value nil))
          (while s
            (let ((try-file (concat b "." (car s))))
              (cond
               ((find-buffer-visiting try-file)
                (switch-to-buffer (find-buffer-visiting
                                   try-file))
                (setq s nil
                      return-value t))
               ((file-readable-p try-file)
                (find-file try-file)
                (setq s nil
                      return-value t))
               (t (setq s (cdr s))))))
          return-value))))

(define-key global-map (kbd "C-x M-D") 'dos2unix)

;;Format the whole buffer.
(defun indent-whole ()
  (interactive)
  (indent-region (point-min) (point-max))
  (message "format successfully"))

(defun indent-buffer()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun unindent-region-with-tab ()
  (interactive)
  (save-excursion
	(if (< (point) (mark)) (exchange-point-and-mark))
	(let ((save-mark (mark)))
	  (if (= (point) (line-beginning-position)) (previous-line 1))
	  (goto-char (line-beginning-position))
	  (while (>= (point) save-mark)
		(goto-char (line-beginning-position))
		(if (= (string-to-char "\t") (char-after (point))) (delete-char 1))
		(previous-line 1)))))
(global-set-key [(backtab)] 'unindent-region-with-tab)

(defun major-mode-heuristic (symbol)
  (and (fboundp symbol)
       (string-match ".*-mode$" (symbol-name symbol))))

(defun switch-major-mode (mode)
  "shift to major mode"
  (interactive
   (let ((fn switch-major-mode-last-mode) val)
     (setq val
           (completing-read
            (if fn (format "switch major-mode为(缺省为%s): " fn) "switch major mode为: ")
            obarray 'major-mode-heuristic t nil nil (symbol-name fn)))
     (list (intern val))))
  (let ((last-mode major-mode))
    (funcall mode)
    (setq switch-major-mode-last-mode last-mode)))
(global-set-key (kbd "C-x q") 'switch-major-mode)

(defun get-mode-name ()
  "Show `major-mode'及`mode-name'"
  (interactive)
  (message "major-mode为%s, mode-name为%s" major-mode mode-name))
(global-set-key (kbd "C-x m") 'get-mode-name)

;; View the process
(autoload 'list-processes+ "list-processes+" "Enhanced `list-processes' command" t)

(defun switch-to-scratch ()
  "Switch*scratch*"
  (interactive)
  (let ((buffer (get-buffer-create "*scratch*")))
    (switch-to-buffer buffer)
    (unless (equal major-mode 'lisp-interaction-mode)
      (lisp-interaction-mode))))
(global-set-key (kbd "C-x s") 'switch-to-scratch)

(defun visit-.emacs ()
  "Visit.emacs文件"
  (interactive)
  (find-file (concat my-emacs-path ".emacs")))



;;;###autoload
(defun update-current-file-autoloads (file &optional save-after)
  "`update-file-autoloads' for current file."
  (interactive "fUpdate autoloads for file: \np")
  (let* ((load-file (expand-file-name "loaddefs.el"))
         (generated-autoload-file load-file))
    (unless (file-exists-p load-file)
      (shell-command (concat "touch " load-file)))
    (update-file-autoloads file save-after)))
(global-set-key (kbd "C-x E") 'visit-.emacs)

;; * make hash-table
(defun mkhtb (&rest rest)
  (let* ((lst (if (eq (logand (length rest) 1) 1)
                  `[,@rest nil]
                `[,@rest]))
         (cnt (/ (length lst) 2))
         (size (+ cnt 2 (/ cnt 5)))
         (h (make-hash-table :test 'equal :size size)))
    (while (> cnt 0)
      (puthash
       (aref lst (- (* cnt 2) 2)) (aref lst (- (* cnt 2) 1)) h)
      (setq cnt (1- cnt)))
    h))
(defmacro mkht (&rest rest)
  `(apply 'mkhtb '(,@rest)))

;; * concat symbol
(defun concat-symbol (&rest lst)
  (intern (apply 'concat (mapcar (lambda(x)(if (symbolp x) (symbol-name x) x)) lst))))

;; * pretty symbol
(defvar *unicode-symbol*
  (mkht
   left-corner-bracket #X300C
   right-corner-bracket #X300D
   open-parenthesis #XFF08
   close-parenthesis #XFF09
   vertical-bar #@7:#X2502 #@7:#X2503 #XFF5C
   double-vertical-bar #X2016
   backslash #X2198 #@7:#XFF3C #@7:#X2572
   left-arrow 8592
   up-arrow 8593
   right-arrow 8594
   down-arrow 8595
   double-vertical-bar #X2551
   equal #X003d
   not-equal #X2260
   identical #X2261
   not-identical #X2262
   less-than #X003c
   greater-than #X003e
   less-than-or-equal-to #X2264
   greater-than-or-equal-to #X2265
   logical-and #X2227
   logical-or #X2228
   logical-neg #X00AC
   'nil #X2205
   dagger #X2020
   double-dagger #X2021
   horizontal-ellipsis #X2026
   reference-mark #X203B
   double-exclamation #X203C
   prime #X2032
   double-prime #X2033
   for-all #X2200
   there-exists #X2203
   element-of #X2208
   square-root #X221A
   squared #X00B2
   cubed #X00B3
   lambda #X03BB
   ;; lambda [?L (11 . 7) ?M (10 . 1) ?a (11 . 9) ?b (11 . 10) ?d (11 . 1) ?a]
   ;; [?L (11 . 7) ?a (11 . 9) ?M (11 . 9) ?b (11 . 10) ?d (11 . 1) ?a]
   alpha #X03B1
   beta #X03B2
   gamma #X03B3
   delta #X03B4
   ))

(provide 'init-function)
