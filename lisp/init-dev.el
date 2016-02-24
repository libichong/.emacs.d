(require 'ctypes)
(require 'xcscope);; it provide cscope-index-file which call cscope-indexer.bat
(require 'csingleton)

(setq-default c-indent-tabs-mode t     ; Pressing TAB should cause indentation
                c-indent-level 4         ; A TAB is equivilent to four spaces
                c-argdecl-indent 0       ; Do not indent argument decl's extra
                c-tab-always-indent t
                backward-delete-function nil) ; DO NOT expand tabs when deleting

(c-add-style "microsoft"
              '("stroustrup"
                (c-offsets-alist
                 (innamespace . -)
                 (inline-open . 0)
                 (inher-cont . c-lineup-multi-inher)
                 (arglist-cont-nonempty . +)
                 (template-args-cont . +))))
(setq c-default-style "microsoft")
(defun my-c-mode-hook ()
  (require 'ctypes)
  (turn-on-font-lock)
  (c-set-style "microsoft")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

(defun my:c++-init ()
  (auto-complete-mode 1)
  (imenu-add-menubar-index)
  (which-function-mode 1)
  (hs-minor-mode 1)
  (gtags-mode 1)
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|TBD\\|BUG\\):" 1 font-lock-warning-face t)))
  (linum-mode 1)
  (toggle-truncate-lines 1)
  (c-set-offset 'innamespace 0)
  )

(defun my-ctypes-load-hook ()
   (ctypes-read-file "~/.ctypes_std_c" nil t t))
(add-hook 'ctypes-load-hook 'my-ctypes-load-hook)
(setq ctypes-write-types-at-exit t)
;;(ctypes-read-file nil nil t t)
(ctypes-auto-parse-mode 1)


(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my:c++-init)

(require 'gtags)
(global-set-key (kbd "M-.") 'gtags-find-tag)
(global-set-key (kbd "M-*") 'gtags-pop-stack)

(defun my-csharp-mode-fn ()
     "function that runs when csharp-mode is initialized for a buffer."
     (turn-on-auto-revert-mode)
     (setq indent-tabs-mode nil)
     (auto-complete-mode 1)
     (which-function-mode 1)
    (hs-minor-mode 1)
    (font-lock-add-keywords nil
                            '(("\\<\\(FIXME\\|TODO\\|TBD\\|BUG\\):" 1 font-lock-warning-face t)))
    (toggle-truncate-lines 1)
    (c-set-offset 'innamespace '+)
    (c-set-offset 'inline-open 0)

    )
(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

(defun my-python-mode-fn ()
     "function that runs when csharp-mode is initialized for a buffer."
     (turn-on-auto-revert-mode)
     (setq indent-tabs-mode nil)
     (auto-complete-mode 1)
     (setq python-indent-offset 4)
     (setq python-indent-guess-indent-offset nil)
     )
(add-hook  'python-mode-hook 'my-python-mode-fn t)

(global-set-key (kbd "<f8>") 'gcc)
(defun gcc()
  (interactive)
  ;; ²éÕÒ Makefile
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
        (command nil))
    (if (not (null
              (find t candidate-make-file-name :key
                    '(lambda (f) (file-readable-p f)))))
        (setq command "make -k ")
      (if (null (buffer-file-name (current-buffer)))
          (message "Buffer not attached to a file, won't compile!")
        (if (eq major-mode 'c-mode)
            (setq command
                  (concat "gcc.exe -Wall -o "
                          (file-name-sans-extension
                           (file-name-nondirectory buffer-file-name))
                          " "
                          (file-name-nondirectory buffer-file-name)
                          " -g -lm "))
          (if (eq major-mode 'c++-mode)
              (setq command
                    (concat "g++.exe -Wall -o "
                            (file-name-sans-extension
                             (file-name-nondirectory buffer-file-name))
                            " "
                            (file-name-nondirectory buffer-file-name)
                            " -g -lm "))
            (message "Unknow mode, won't compile!")))))
    (if (not (null command))
        (let ((command (read-from-minibuffer "Compile command: " command)))
          (compile command)))))


;; This version uses lwarn instead of message-box in the original version.
;; lwarn will open another window, and display the warning in there.
(defun flymake-display-warning (warning)
  "Display a warning to the user, using lwarn"
  (lwarn 'flymake :warning warning))

;; Using lwarn might be kind of annoying on its own, popping up windows and
;; what not. If you prefer to recieve the warnings in the mini-buffer, use:
(defun flymake-display-warning (warning)
  "Display a warning to the user, using lwarn"
  (message warning))

(require 'eshell-user-key)

(defalias 'f 'find-file)
(defalias 'ee (lambda()(find-file (expand-file-name "44eshell.el" init-dir))))
(defalias 'aa (lambda()(find-file eshell-aliases-file)))
(defalias 'rr (lambda()(find-file (expand-file-name "qref.org" sand-box))))
(defalias 'ss  'shell-command-to-string)

(setq ansi-color-names-vector ; better contrast colors
      ["black" "red4" "green4" "yellow4"
       "blue3" "magenta4" "cyan4" "white"])
(add-hook 'eshell-mode-hook (lambda()
                              (outline-minor-mode 1)
                              (setq outline-regexp "^[^#$\n]* [#>]+ "
                                    scroll-margin 0
                                    eshell-scroll-to-bottom-on-output t
                                    eshell-scroll-show-maximum-output t)
                              (add-to-list 'eshell-output-filter-functions
                                           'eshell-postoutput-scroll-to-bottom)
                              (define-key eshell-mode-map [up] 'previous-line)
                              (define-key eshell-mode-map [down] 'next-line)
                              (setq eshell-cmpl-cycle-completions nil)
                              (setq eshell-prompt-regexp "^[^#$\n]*[#$] ")
                              (local-set-key    "<tab>"    'user-tab)
                              (local-set-key   "<return>" 'user-ret)
                              (setq eshell-save-history-on-exit t
                                    eshell-history-size 512
                                    eshell-hist-ignoredups t
                                    eshell-cmpl-ignore-case t
                                    eshell-cp-interactive-query t
                                    eshell-ln-interactive-query t
                                    eshell-mv-interactive-query t
                                    eshell-rm-interactive-query t
                                    eshell-mv-overwrite-files nil
                                    eshell-highlight-prompt   t)
                              ))

(defun eshell/desktop()
  "go to the desktop"
  (eshell/cd "C:/Users/bichongl/Desktop")
  )

(defun eshell/cls()
  "Clear the shell buffer ala Unix'clear or DOs'cls"
  (interactive)
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
    ;;simply delete the region
    (delete-region (point-min) (point-max)))
  )

(defun eshell/clear()
  "Clear the shell buffer ala Unix'clear or DOs'cls"
  (interactive)
  ;; the shell prompts are read-only, so clear that for the duration
  (let ((inhibit-read-only t))
    ;;simply delete the region
    (delete-region (point-min) (point-max)))
  )

(defun eshell/ii (file)(ido-find-file file))
(defun eshell/ed (file1 file2)(ediff-files file1 file2))

(require 'compile)
                                        ;(add-to-list 'compilation-error-regexp-alist 'corext)
(add-to-list 'compilation-error-regexp-alist 'error-continuation)
(add-to-list 'compilation-error-regexp-alist 'msunittest)
(add-to-list 'compilation-error-regexp-alist 'msbuild)

                                        ;(add-to-list 'compilation-error-regexp-alist-alist
                                        ;             '(corext "errors in directory \\(.*\\)$" 1))
(add-to-list 'compilation-error-regexp-alist-alist
             '(error-continuation
               "error-continuation.* '?\\(.*\\)(\\([0-9]+\\))" 1 2 0))
(add-to-list 'compilation-error-regexp-alist-alist
             '(msunittest "At \\(.*\\):\\([0-9]+\\):" 1 2))
(add-to-list 'compilation-error-regexp-alist-alist
             '(msbuild "[0-9]+>\\([a-zA-Z0-9:\\\\\\\._]\\)(\\([0-9]+\\)) : error" 1 2))

(defun sd:source-depot-root ()
  "find the root of source depot"
  (let ((current-dir default-directory)
        (last-dir nil))
    (while (not (or (equal current-dir last-dir)
                    (file-exists-p (format "%s/tools/path1st/myenv.cmd" current-dir))))
      (setq last-dir current-dir)
      (setq current-dir (directory-file-name (file-name-directory current-dir))))
    (if (file-exists-p (format "%s/tools/path1st/myenv.cmd" current-dir))
        (replace-regexp-in-string "/" "\\\\" current-dir)
      nil)))

(defun sd:compile ()
  "get compile-command at point"
  (interactive)
  (compile (format "sdenv build -cC -amd64")))

(defun sd:edit ()
  (interactive)
  (sd:command "sd" "edit" (buffer-file-name))
  (revert-buffer nil t))

(defun sd:revert ()
  (interactive)
  (sd:with-current-source-depot sd-root
                                (sd:sd-command sd-root "revert" (buffer-file-name))
                                (revert-buffer nil t)))

(defun sd:command (cmd &rest args)
  (let ((funcargs (append (list "sdenv"
                                cmd
                                nil nil nil)
                          args)))
    (shell-command-to-string (mapconcat 'identity funcargs " "))))

(defun sd:command-args (cmd args)
  (let ((funcargs (append (list "sdenv"
                                cmd
                                nil nil nil)
                          args)))
    (shell-command-to-string (mapconcat 'identity funcargs " "))))

(defun sd:sync ()
  (interactive)
  (start-process
   "*sd sync*"
   "*sd sync*"
   (format "sdenv sd sync"))
  (pop-to-buffer "*sd sync*"))

(defun sd:version ()
  (interactive)
  (sd:command "sdv" (buffer-file-name)))

(defun sd:diff ()
  (interactive)
  (sd:command "sd" "diff" (buffer-file-name)))

(defun sd:delete ()
  (interactive)
  (sd:command "sd" "delete" (buffer-file-name)))

(defun sd:add ()
  (interactive)
  (sd:command "sd" "add" (buffer-file-name)))

(defun sdb ()
  (interactive)
  (sd:command "sdb"))

(defalias 'sd:run 'sd:command)

(defun sd:search (pattern file)
  (interactive
   (list (read-string "Pattern: " (gtags-current-token))
         (read-string "File Regex: " "\\.(cpp|c|h|hpp)$")))
  (grep
   (format "csearch -f \"%s\" -n \"%s\"" file pattern)))

(defun sd:grin (cmd)
  (interactive
   (list (read-string "Command: " (concat grin-cmd " " (gtags-current-token)))))
  (let (null-device)
    (grep cmd)))

(global-set-key (kbd "<f7>") 'sd:compile)

(add-hook 'eshell-mode-hook
          '(lambda ()
             (define-key eshell-mode-map "\t" 'pcomplete-list)
             (require 'eshell)
             (require 'em-alias)
             (eshell/alias "sd" "sdenv sd $*")
             (eshell/alias "sdv" "sdenv sdv $*")
             (eshell/alias "sdb" "sdenv sdb $*")
             (eshell/alias "windiff" "sdenv windiff $*")
             (eshell/alias "winide" "sdenv winide $*")
             (eshell/alias "debug" "sdenv winide /debugexe $*")
             (eshell/alias "l" "ls -la $*")
             (eshell/alias "ll" "ls -la $*")
             (eshell/alias "start" "explorer $*")
             (eshell/alias ".." "cd ..")
             (eshell/alias "dir" "ls -la $*")
             ))


(defun vs:edit ()
  (interactive)
  (shell-command (format "vscmd edit \"%s:%d:%d\"" (buffer-file-name) (line-number-at-pos) (1+ (current-column)))))

(defun vs:breakpoint ()
  (interactive)
  (let ((cmd (format "vscmd break \"%s:%d:%d\"" (buffer-file-name) (line-number-at-pos) (1+ (current-column)))))
    (message cmd)
    (shell-command cmd)))

(defun sd:go-to-eshell ()
  (interactive)
  (eshell)
  (eshell/cd default-directory)
  (eshell-send-input))

(global-set-key (kbd "<f9>") 'sd:go-to-eshell)
(global-set-key (kbd "<ESC> SPC") 'global-whitespace-mode)

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

(when (string= system-name "BICHONGHP")
(setq default-directory "E:/Code/kirin_web_dev_mm/private/indexgen/multimedia/"))
(when (string= system-name "STCSRV-C92")
(setq default-directory "D:/Code/kirin_web_dev_mm/private/indexgen/multimedia/"))


;;;###autoload
(defun eshell/root ()
  "Change directory to the project's root."
  (eshell/cd (locate-dominating-file default-directory "private/..")))

(defun eshell/extract (file)
  (let ((command (some (lambda (x)
                         (if (string-match-p (car x) file)
                             (cadr x)))
                       '((".*\.tar.bz2" "tar xjf")
                         (".*\.tar.gz" "tar xzf")
                         (".*\.bz2" "bunzip2")
                         (".*\.rar" "unrar x")
                         (".*\.gz" "gunzip")
                         (".*\.tar" "tar xf")
                         (".*\.tbz2" "tar xjf")
                         (".*\.tgz" "tar xzf")
                         (".*\.zip" "unzip")
                         (".*\.Z" "uncompress")
                         (".*" "echo 'Could not extract the file:'")))))
    (eshell-command-result (concat command " " file))))

(defun bc-before-save-file ()
    (untabify (point-min) (point-max))
    (delete-trailing-whitespace (point-min) (point-max)))

(add-hook 'before-save-hook 'bc-before-save-file)

(require-package 'csharp-mode)
(add-to-list 'auto-mode-alist '("\\.script$" . (csharp-mode 1)))
(add-to-list 'auto-mode-alist '("\\.script.cs$" . (csharp-mode 1)))
(add-to-list 'auto-mode-alist '("\\.cs$" . (csharp-mode 1)))


(provide 'init-dev)
