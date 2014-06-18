(require 'eshell-user-key)

(defalias 'ff 'find-file)
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

(global-set-key (kbd "<f11>") 'sd:go-to-eshell)
(global-set-key (kbd "<f6>") 'sd:edit)
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

(provide 'sdenv-settings)
