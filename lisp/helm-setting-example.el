(setq
 helm-action-buffer "*helm action*"
 helm-adaptative-mode nil
 helm-additional-attributes '(name header-name candidates candidates-process action coerce type init delayed-init match candidate-transformer
                              filtered-candidate-transformer action-transformer pattern-transformer delayed volatile requires-pattern persistent-action
                              candidates-in-buffer search search-from-end get-line display-to-real real-to-display cleanup candidate-number-limit
                              accept-empty dummy multiline update mode-line header-line resume keymap help-message match-part match-strict nohighlight
                              no-delay-on-input history info-index index-nodes candidates-file headline condition subexp persistent-help default-action
                              default-directory before-jump-hook after-jump-hook adjust recenter target-file)
 helm-additional-type-attributes nil
 helm-after-action-hook '(helm-c-ffap-line-goto-line helm-files-save-file-name-history)
 helm-after-initialize-hook '(helm-reset-yank-point helm-reset-marked-candidates helm-clear-visible-mark)
 helm-after-persistent-action-hook '(helm-c-ffap-line-goto-line helm-reset-yank-point helm-match-line-update)
 helm-after-update-hook '(helm-after-update-hook--outline helm-ff-maybe-mark-candidates helm-ff-auto-expand-to-home-or-root
                          helm-ff-update-when-only-one-matched helm-ff-move-to-first-real-candidate helm-ff-retrieve-last-expanded
                          helm-confirm-and-exit-hook)
 helm-alive-p nil
 helm-argument-keys '(:sources :input :prompt :resume :preselect :buffer :keymap :default :history)
 helm-async-processes nil
 helm-attributes '(name header-name candidates candidates-process action coerce type init delayed-init match candidate-transformer
                   filtered-candidate-transformer action-transformer pattern-transformer delayed volatile requires-pattern persistent-action
                   candidates-in-buffer search search-from-end get-line display-to-real real-to-display cleanup candidate-number-limit accept-empty dummy
                   multiline update mode-line header-line resume keymap help-message match-part match-strict nohighlight no-delay-on-input history
                   info-index index-nodes candidates-file headline condition subexp persistent-help default-action default-directory before-jump-hook
                   after-jump-hook adjust recenter target-file)
 helm-before-action-hook '(helm-ff-before-action-hook-fn)
 helm-before-initialize-hook nil
 helm-bookmark-help-message "== Helm bookmark name Map ==\nSpecific commands for bookmarks:\n\\<helm-c-bookmark-map>\n\\[helm-c-bookmark-run-jump-other-window]                ->Jump other window.\n\\[helm-c-bookmark-run-delete]                ->Delete bookmark.\n\\[helm-c-bmkext-run-edit]                ->Edit bookmark (only for bmkext).\n\\[helm-c-bookmark-help]                ->Run this help.\n\n== Helm Map ==\n\\{helm-map}"
 helm-bookmark-mode-line-string '("Bookmark(s)"
                                  "\\<helm-c-bookmark-map>\\[helm-c-bookmark-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct")
 helm-browse-url-chromium-program "chromium-browser"
 helm-browse-url-default-browser-alist '(("/usr/bin/w3m" . w3m-browse-url) ("firefox" . browse-url-firefox) ("chromium-browser" . helm-browse-url-chromium)
                                         ("uzbl-browser" . helm-browse-url-uzbl) ("kfmclient" . browse-url-kde) ("gnome-moz-remote" . browse-url-gnome-moz)
                                         ("mozilla" . browse-url-mozilla) ("galeon" . browse-url-galeon) ("netscape" . browse-url-netscape)
                                         ("xmosaic" . browse-url-mosaic) ("xterm" . browse-url-text-xterm))
 helm-browse-url-uzbl-program "uzbl-browser"
 helm-buffer "*helm*"
 helm-buffer-file-name "/home/kca/bash/bash.org"
 helm-buffer-max-length 20
 helm-buffer-mode-line-string '("Buffer(s)"
                                "\\<helm-c-buffer-map>\\[helm-c-buffer-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "String displayed in mode-line in `helm-c-source-buffers-list'")
 helm-buffers '("*helm mini*" "*helm multi occur*" "*helm occur*")
 helm-buffers-favorite-modes '(lisp-interaction-mode emacs-lisp-mode text-mode org-mode)
 helm-buffers-ido-virtual-help-message "== Helm ido virtual buffers Map ==\nSpecific commands for ido virtuals buffers:\n\\<helm-buffers-ido-virtual-map>\n\\[helm-ff-run-switch-other-window]                ->Switch other window. \n\\[helm-ff-run-switch-other-frame]                ->Switch other frame.\n\\[helm-ff-run-grep]                ->Grep file.\n\\[helm-ff-run-zgrep]                ->Zgrep file.\n\\[helm-ff-run-delete-file]                ->Delete file.\n\\[helm-ff-run-open-file-externally]                ->Open file externally.\n\\[helm-buffers-ido-virtual-help]                ->Display this help.\n\n== Helm Map ==\n\\{helm-map}"
 helm-buffers-ido-virtual-mode-line-string '("Killed Buffer(s)"
                                             "\\<helm-buffers-ido-virtual-map>\\[helm-buffers-ido-virtual-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "String displayed in mode-line in `helm-c-source-buffers-list'")
 helm-buffers-list-cache '("*info*" "math-notes.org" "*scratch*" "*Messages*" "*helm-mode-find-file*" "*Help*" "*helm occur*" "*helm mini*"
                           "*helm multi occur*" "bash.org")
 helm-bug-report-salutation "Describe bug below, using a precise recipe.\n\nWhen I executed M-x ...\n\nHow to send a bug report:\n  1) Be sure to use the LATEST version of helm.el.\n  2) Enable debugger. M-x toggle-debug-on-error or (setq debug-on-error t)\n  3) Use Lisp version instead of compiled one: (load \"helm.el\")\n  4) If you got an error, please paste *Backtrace* buffer.\n  5) Type C-c C-c to send."
 helm-build-regexp-history nil
 helm-c-adaptive-done nil
 helm-c-adaptive-history nil
 helm-c-adaptive-history-file "~/.emacs.d/helm-c-adaptive-history"
 helm-c-adaptive-history-length 50
 helm-c-boring-buffer-regexp-list '("\\` " "\\*helm" "\\*helm-mode" "\\*Echo Area" "\\*Minibuf")
 helm-c-boring-file-regexp-list '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "~$")
 helm-c-browse-code-regexp-alist '((lisp-interaction-mode .
                                    "^ *(def\\(un\\|subst\\|macro\\|face\\|alias\\|advice\\|struct\\|type\\|theme\\|var\\|group\\|custom\\|const\\|method\\|class\\)")
                                   (emacs-lisp-mode .
                                    "^ *(def\\(un\\|subst\\|macro\\|face\\|alias\\|advice\\|struct\\|type\\|theme\\|var\\|group\\|custom\\|const\\|method\\|class\\)")
                                   (lisp-mode .
                                    "^ *(def\\(un\\|subst\\|macro\\|face\\|alias\\|advice\\|struct\\|type\\|theme\\|var\\|group\\|custom\\|const\\|method\\|class\\)")
                                   (python-mode . "\\<def\\>\\|\\<class\\>"))
 helm-c-browse-code-regexp-lisp "^ *(def\\(un\\|subst\\|macro\\|face\\|alias\\|advice\\|struct\\|type\\|theme\\|var\\|group\\|custom\\|const\\|method\\|class\\)"
 helm-c-browse-code-regexp-python "\\<def\\>\\|\\<class\\>"
 helm-c-buffer-help-message "== Helm Buffer ==\n\nTips:\nYou can enter a partial name of major-mode (e.g lisp, sh) to narrow down buffers.\nEnter then a space and a pattern to narrow down to buffers matching this pattern.\nIf you enter a space and a pattern prefixed by \"@\" helm will search for text matching\nthis pattern INSIDE the buffer (i.e not in the name of buffer).\nNOTE that if you enter your pattern prefixed with \"@\" but escaped, helm will search a buffer\nmatching \"@pattern\" but will not search inside.\n\ne.g\n\nif I enter in pattern prompt:\n\"lisp ^helm @moc\"\nhelm will narrow down the list by selecting only buffers that are in lisp mode, start by helm\nand match \"moc\" in their contents.\n\nif I enter in pattern prompt:\n\"lisp ^helm moc\"\nNotice there is no \"@\" this time\nhelm will look for lisp mode buffers starting by \"helm\" and have \"moc\" in their name.\n\nWhen creating a new buffer use \\[universal-argument] to choose a mode for your buffer in a list.\nThis list is customizable, see `helm-buffers-favorite-modes'.\n\nMeaning of colors and prefixes for buffers:\nRemote buffers are prefixed with '@'.\nRed        => A buffer saved by an external process.\nIndianred2 => A new buffer file not already saved on disk.\nOrange     => A buffer file modified and not saved.\n\n\n\nSpecific commands for `helm-buffers-list':\n\\<helm-c-buffer-map>\n\\[helm-buffer-run-zgrep]                ->Grep Buffer(s) works as zgrep too (C-u grep all buffers but non--file buffers).\n\\[helm-buffers-run-multi-occur]                ->Multi Occur buffer or marked buffers. (C-u force searching current-buffer).\n\\[helm-buffer-switch-other-window]                ->Switch other window.\n\\[helm-buffer-switch-other-frame]                ->Switch other frame.\n\\[helm-buffer-run-query-replace-regexp]                ->Query replace regexp in marked buffers.\n\\[helm-buffer-run-query-replace]                ->Query replace in marked buffers.\n\\[helm-buffer-switch-to-elscreen]                ->Find buffer in Elscreen.\n\\[helm-buffer-run-ediff]                ->Ediff current buffer with candidate.  If two marked buffers ediff those buffers.\n\\[helm-buffer-run-ediff-merge]                ->Ediff merge current buffer with candidate.  If two marked buffers ediff merge those buffers.\n\\[helm-buffer-diff-persistent]                ->Toggle Diff buffer with saved file without quitting.\n\\[helm-buffer-revert-persistent]                ->Revert buffer without quitting.\n\\[helm-buffer-save-persistent]                ->Save buffer without quitting.\n\\[helm-buffer-run-kill-buffers]                ->Delete marked buffers and quit.\n\\[helm-toggle-all-marks]                ->Toggle all marks.\n\\[helm-mark-all]                ->Mark all.\n\\[helm-c-buffer-help]                ->Display this help.\n\n== Helm Map ==\n\\{helm-map}"
 helm-c-ctags-modes '(c-mode c++-mode awk-mode csharp-mode java-mode javascript-mode lua-mode makefile-mode pascal-mode perl-mode cperl-mode php-mode
                      python-mode scheme-mode sh-mode slang-mode sql-mode tcl-mode)
 helm-c-default-external-file-browser "nautilus"
 helm-c-default-info-index-list '("elisp" "cl" "org" "gnus" "tramp" "ratpoison" "zsh" "bash" "coreutils" "fileutils" "find" "sh-utils" "textutils" "libc"
                                  "make" "automake" "autoconf" "emacs-lisp-intro" "emacs" "elib" "eieio" "gauche-refe" "guile" "guile-tut" "goops" "screen"
                                  "latex" "gawk" "sed" "m4" "wget" "binutils" "as" "bfd" "gprof" "ld" "diff" "flex" "grep" "gzip" "libtool" "texinfo"
                                  "info" "gdb" "stabs" "cvsbook" "cvs" "bison" "id-utils" "global")
 helm-c-default-zgrep-command "zgrep -n%cH -e %p %f"
 helm-c-esh-help-message "== Helm eshell on file ==\n\nTips:\n\n- Passing extra args after filename:\n\nNormally your command or alias will be called with file as argument.\n\ne.g <command> 'candidate_file'\n\nBut you can also pass an argument or more after 'candidate_file' like this:\n\n<command> %s [extra_args]\n\n\n'candidate_file' will be inserted at '%s' and your command will look at this:\n\n<command> 'candidate_file' [extra_args]\n\n- Specify many files as args (marked files):\n\ne.g <command> file1 file2 ...\n\nCall `helm-find-files-eshell-command-on-file' with one prefix-arg \nOtherwise you can pass one prefix-arg from the command selection buffer.\n\nWith two prefix-arg before starting or from the command selection buffer\nthe output is printed to your `current-buffer'.\n\nWith no prefix-arg or a prefix-arg value of '(16) (C-u C-u) the command\nis called once for each file like this:\n\n<command> file1 <command> file2 etc...\n\n\nSpecific commands for `helm-find-files-eshell-command-on-file':\n\\<helm-esh-on-file-map>\n\\[helm-esh-help]                ->Display this help.\n\n== Helm Map ==\n\\{helm-map}"
 helm-c-etags-cache #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8 data ())
 helm-c-etags-mtime-alist nil
 helm-c-etags-tag-file-dir nil
 helm-c-etags-tag-file-name "TAGS"
 helm-c-etags-tag-file-search-limit 10
 helm-c-external-commands-list nil
 helm-c-external-programs-associations nil
 helm-c-file-cache-files nil
 helm-c-file-cache-initialized-p nil
 helm-c-find-files-doc-header " (`C-l': Go to precedent level)"
 helm-c-google-suggest-default-browser-function nil
 helm-c-google-suggest-default-function 'helm-c-google-suggest-set-candidates
 helm-c-google-suggest-search-url "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
 helm-c-google-suggest-url "http://google.com/complete/search?output=toolbar&q="
 helm-c-grep-default-command "grep -d skip %e -n%cH -e %p %f"
 helm-c-grep-default-directory-fn nil
 helm-c-grep-default-function 'helm-c-grep-init
 helm-c-grep-default-recurse-command "grep -d recurse %e -n%cH -e %p %f"
 helm-c-grep-history '("Org Mode")
 helm-c-grep-max-length-history 100
 helm-c-grep-preferred-ext nil
 helm-c-grep-use-ioccur-style-keys t
 helm-c-home-url "http://www.google.fr"
 helm-c-info-pages nil
 helm-c-locate-command nil
 helm-c-pdfgrep-default-command "pdfgrep --color never -niH %s %s"
 helm-c-pdfgrep-default-function 'helm-c-pdfgrep-init
 helm-c-pdfgrep-default-read-command "xpdf '%f' %p"
 helm-c-rzgrep-cache #s(hash-table size 65 test equal rehash-size 1.5 rehash-threshold 0.8 data ())
 helm-c-ucs-help-message "== Helm Ucs ==\n\nSpecific commands for `helm-ucs':\n\\<helm-c-ucs-map>\n\\[helm-c-ucs-persistent-insert]        ->Insert char.\n\\[helm-c-ucs-persistent-forward]        ->Forward char.\n\\[helm-c-ucs-persistent-backward]        ->Backward char.\n\\[helm-c-ucs-persistent-delete]        ->Delete char backward.\n\\[helm-c-ucs-help]                ->Show this help.\n\n\n== Helm Map ==\n\\{helm-map}"
 helm-c-ucs-mode-line-string "\\<helm-c-ucs-map>\\[helm-c-ucs-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
 helm-c-yahoo-suggest-search-url "http://search.yahoo.com/search?&ei=UTF-8&fr&h=c&p="
 helm-c-yahoo-suggest-url "http://search.yahooapis.com/WebSearchService/V1/relatedSuggestion?appid=Generic&query="
 helm-c-zgrep-recurse-flag nil
 helm-candidate-number-limit 100
 helm-candidate-separator "--------------------"
 helm-canonical-home "/home/kca"
 helm-case-fold-search 'smart
 helm-cleanup-hook '(helm-ff-save-history helm-reset-yank-point helm-match-line-cleanup)
 helm-comp-read-case-fold-search 'smart
 helm-comp-read-mode-line "\\<helm-comp-read-map>\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
 helm-compile-source-functions '(helm-compile-source--persistent-help helm-compile-source--helm-headline helm-compile-source--candidates-file
                                 helm-compile-source--info-index helm-compile-source--match-plugin helm-compile-source--type helm-compile-source--dummy
                                 helm-compile-source--candidates-in-buffer helm-compile-source--type-customize helm-compile-source--default-action)
 helm-compile-source-functions-default '(helm-compile-source--type helm-compile-source--dummy helm-compile-source--candidates-in-buffer)
 helm-compiled-sources '(((match helm-mp-exact-match helm-mp-3-match) (search helm-mp-exact-search helm-mp-3-search) (name . "multi-occur History")
                          (candidates lambda nil
                           (let ((all (helm-comp-read-get-candidates history test nil nil)))
                            (delete ""
                             (helm-fast-remove-dups (if (and default (not (string= default ""))) (delq nil (cons default (delete default all))) all) :test
                              (quote equal))
                             )
                            )
                           )
                          (filtered-candidate-transformer lambda (candidates sources)
                           (loop for i in candidates do (set-text-properties 0 (length i) nil i) collect i))
                          (persistent-action) (persistent-help . "DoNothing")
                          (mode-line .
                           "\\<helm-comp-read-map>\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct")
                          (action ("Sole action (Identity)" lambda (candidate) (if marked-candidates (helm-marked-candidates) (identity candidate))))
                          (header-line . helm-persistent-help-string))
                         ((match helm-mp-exact-match helm-mp-3-match) (search helm-mp-exact-search helm-mp-3-search) (name . "multi-occur")
                          (candidates lambda nil
                           (let ((cands (helm-comp-read-get-candidates collection test sort alistp))) (setq helm-cr-unknow-pattern-flag nil)
                            (unless
                             (or (eq must-match t) (string= helm-pattern "") (assoc helm-pattern cands) (assoc (intern helm-pattern) cands)
                              (member helm-pattern cands))
                             (setq cands (append (list helm-pattern) cands)) (setq helm-cr-unknow-pattern-flag t))
                            (if (and default (not (string= default ""))) (delq nil (cons default (delete default cands))) cands))
                           )
                          (filtered-candidate-transformer . helm-cr-default-transformer) (requires-pattern . 0) (persistent-action)
                          (persistent-help . "DoNothing")
                          (mode-line .
                           "\\<helm-comp-read-map>\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct")
                          (action ("Sole action (Identity)" lambda (candidate) (if marked-candidates (helm-marked-candidates) (identity candidate))))
                          (volatile) (header-line . helm-persistent-help-string))
                         )
 helm-completing-read-handlers-alist '((describe-function . helm-completing-read-symbols) (describe-variable . helm-completing-read-symbols)
                                       (debug-on-entry . helm-completing-read-symbols) (find-function . helm-completing-read-symbols)
                                       (trace-function . helm-completing-read-symbols) (trace-function-background . helm-completing-read-symbols)
                                       (find-tag . helm-completing-read-with-cands-in-buffer) (ffap-alternate-file))
 helm-completion-mode-quit-message "Helm completion disabled"
 helm-completion-mode-start-message "Helm completion enabled"
 helm-completion-mode-string " Helm"
 helm-completion-window-scroll-margin 5
 helm-cr-unknow-pattern-flag nil
 helm-current-buffer #<buffer bash.org>
 helm-current-position '(3685 . 1)
 helm-current-prefix-arg nil
 helm-debug nil
 helm-debug-forms nil
 helm-debug-root-directory nil
 helm-debug-variables nil
 helm-default-kbsize 1024.0
 helm-default-match-functions '(#[(candidate) "\302        \"\207" [helm-pattern candidate string-match] 3])
 helm-delayed-init-executed nil
 helm-dired-mode nil
 helm-display-function 'helm-default-display-buffer
 helm-display-source-at-screen-top t
 helm-do-grep-preselect-candidate nil
 helm-eshell-command-on-file-input-history nil
 helm-etags-help-message "== Helm Etags Map ==\nSpecific commands for Etags:\n\\<helm-c-etags-map>\n\\[helm-c-goto-next-file]        ->Next File.\n\\[helm-c-goto-precedent-file]                ->Precedent File.\n\\[helm-yank-text-at-point]                ->Yank Text at point in minibuffer.\n\\[helm-etags-help]                ->Show this help.\n\n== Helm Map ==\n\\{helm-map}"
 helm-etags-mode-line-string "\\<helm-c-etags-map>\\[helm-etags-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
 helm-execute-action-at-once-if-one nil
 helm-exit-status 0
 helm-external-command-history nil
 helm-ff-auto-update-flag t
 helm-ff-auto-update-initial-value t
 helm-ff-avfs-directory "~/.avfs"
 helm-ff-cand-to-mark nil
 helm-ff-default-directory "/home/kca/bash/"
 helm-ff-exif-data-program "exiftran"
 helm-ff-exif-data-program-args "-d"
 helm-ff-file-compressed-list '("gz" "bz2" "zip" "7z")
 helm-ff-file-name-history-use-recentf nil
 helm-ff-help-message "== Helm Find Files ==\n\nTips:\n\n- Enter `~/' at end of pattern to quickly reach home directory.\n- Enter `/' at end of pattern to quickly reach root of your file system.\n- Enter `./' at end of pattern to quickly reach `default-directory' (initial start of session).\n- You can complete with partial basename (e.g \"fb\" will complete \"foobar\").\n- Use `C-u C-z' to watch an image.\n- To browse images directories turn on `helm-follow-mode' and navigate with arrow keys.\n- When entered ediff, hitting `C-g' will ask you to use locate to find the file to ediff with.\n- You can switch to locate with `C-x C-f', with one prefix arg use locale db file or create it,\n  with two prefix arg create or refresh db file.\n- When you want to delete backward characters to e.g creating a new file or directory,\n  autoupdate may keep updating to an existent directory\n  preventing you to do so, in this case just hit C-<backspace> and then <backspace>.\n- You can create a new directory an a new file at the same time, just write the path in prompt\n  and press <RET>.\n  e.g You can create \"~/new/newnew/newnewnew/my_newfile.txt\".\n- To create a new directory, add a \"/\" at end of new name and press <RET>.\n- To create a new file just write the filename not ending with \"/\".\n\n\nSpecific commands for `helm-find-files':\n\\<helm-find-files-map>\n\\[helm-ff-run-locate]                ->Run Locate (C-u to specify locate db, M-n insert basename of candidate)\n\\[helm-ff-run-grep]                ->Run Grep (C-u Recursive).\n\\[helm-ff-run-pdfgrep]                ->Run Pdfgrep on marked files.\n\\[helm-ff-run-zgrep]                ->Run zgrep (C-u Recursive).\n\\[helm-ff-run-etags]                ->Run Etags (C-u use thing-at-point `C-u C-u' reload cache)\n\\[helm-ff-run-rename-file]                ->Rename File (C-u Follow).\n\\[helm-ff-run-copy-file]                ->Copy File (C-u Follow).\n\\[helm-ff-run-byte-compile-file]                ->Byte Compile File (C-u Load).\n\\[helm-ff-run-load-file]                ->Load File.\n\\[helm-ff-run-symlink-file]                ->Symlink File.\n\\[helm-ff-run-hardlink-file]                ->Hardlink file.\n\\[helm-ff-run-delete-file]                ->Delete File.\n\\[helm-ff-run-kill-buffer-persistent]                ->Kill buffer candidate without quitting.\n\\[helm-ff-persistent-delete]                ->Delete file without quitting.\n\\[helm-ff-run-switch-to-eshell]                ->Switch to Eshell.\n\\[helm-ff-run-eshell-command-on-file]                ->Eshell command on file (C-u Run on all marked files at once).\n\\[helm-ff-run-ediff-file]                ->Ediff file.\n\\[helm-ff-run-ediff-merge-file]                ->Ediff merge file.\n\\[helm-ff-run-complete-fn-at-point]                ->Complete file name at point.\n\\[helm-ff-run-switch-other-window]                ->Switch other window.\n\\[helm-ff-run-switch-other-frame]                ->Switch other frame.\n\\[helm-ff-run-open-file-externally]                ->Open file with external program (C-u to choose).\n\\[helm-ff-run-open-file-with-default-tool]                ->Open file externally with default tool.\n\\[helm-ff-rotate-left-persistent]                ->Rotate Image Left.\n\\[helm-ff-rotate-right-persistent]                ->Rotate Image Right.\n\\[helm-find-files-down-one-level]                ->Go down precedent directory.\n\\[helm-ff-run-switch-to-history]                ->Switch to last visited directories history.\n\\[helm-ff-file-name-history]                ->Switch to file name history.\n\\[helm-ff-properties-persistent]                ->Show file properties in a tooltip.\n\\[helm-mark-all]                ->Mark all visibles candidates.\n\\[helm-ff-run-toggle-auto-update]        ->Toggle auto expansion of directories.\n\\[helm-unmark-all]                ->Unmark all candidates, visibles and invisibles.\n\\[helm-ff-run-gnus-attach-files]                ->Gnus attach files to message buffer.\n\\[helm-ff-run-print-file]                ->Print file, (C-u to refresh printers list).\n\\[helm-enlarge-window]                ->Enlarge helm window.\n\\[helm-narrow-window]                ->Narrow helm window.\n\\[helm-ff-run-toggle-basename]                ->Toggle basename/fullpath.\n\\[helm-ff-run-find-file-as-root]                ->Find file as root.\n\\[helm-send-bug-report-from-helm]                ->Send Bug report.\n\\[helm-ff-help]                ->Display this help info.\n\n== Helm Map ==\n\\{helm-map}"
 helm-ff-history '("/home/kca/bash/" "/home/kca/math/" "/home/kca/bash/")
 helm-ff-history-max-length 100
 helm-ff-last-expanded nil
 helm-ff-locate-db-filename "locate.db"
 helm-ff-maximum-candidate-to-decorate 2000
 helm-ff-mode-line-string "\\<helm-find-files-map>\\[helm-ff-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
 helm-ff-newfile-prompt-p t
 helm-ff-printer-list nil
 helm-ff-quick-delete-dont-prompt-for-deletion nil
 helm-ff-search-library-in-sexp nil
 helm-ff-signal-error-on-dot-files t
 helm-ff-smart-completion t
 helm-ff-smart-completion-incompatible-methods '(multi1 multi3p)
 helm-ff-tramp-not-fancy t
 helm-ff-transformer-show-only-basename nil
 helm-ff-url-regexp "\\`\\(news\\(post\\)?:\\|nntp:\\|mailto:\\|file:\\|\\(ftp\\|https?\\|telnet\\|gopher\\|www\\|wais\\):/?/?\\).*"
 helm-file-completion-sources '("Find Files" "Read File Name" "Read File Name History" "Copy Files" "Rename Files" "Symlink Files" "Hardlink Files"
                                "Write File" "Insert File")
 helm-file-name-case-fold-search 'smart
 helm-file-name-history nil
 helm-follow-mode nil
 helm-for-files-preferred-list '(helm-c-source-ffap-line helm-c-source-ffap-guesser helm-c-source-buffers-list helm-c-source-recentf
                                 helm-c-source-bookmarks helm-c-source-file-cache helm-c-source-files-in-current-dir helm-c-source-locate)
 helm-force-updating-p nil
 helm-full-frame nil
 helm-generic-file-help-message "== Helm Generic files Map ==\nSpecific commands for helm locate and others files sources:\n\\<helm-generic-files-map>\n\\[helm-ff-run-toggle-basename]                ->Toggle basename.\n\\[helm-ff-run-grep]                ->Run grep (C-u recurse).\n\\[helm-ff-run-pdfgrep]                ->Run Pdfgrep on marked files.\n\\[helm-ff-run-delete-file]                ->Delete file.\n\\[helm-ff-run-ediff-file]                ->Ediff file.\n\\[helm-ff-run-ediff-merge-file]                ->Ediff merge file.\n\\[helm-ff-run-switch-other-window]                ->Switch other window.\n\\[helm-ff-properties-persistent]                ->Show file properties.\n\\[helm-ff-run-etags]                ->Run etags (C-u use tap, C-u C-u reload DB).\n\\[helm-yank-text-at-point]                ->Yank text at point.\n\\[helm-ff-run-open-file-externally]                ->Open file with external program (C-u to choose).\n\\[helm-ff-run-open-file-with-default-tool]                ->Open file externally with default tool.\n\nLocate tips:\nYou can add after writing search pattern any of the locate command line options.\ne.g -b, -e, -n <number>...etc.\nSee Man locate for more infos.\n\n== Helm Map ==\n\\{helm-map}"
 helm-generic-file-mode-line-string "\\<helm-generic-files-map>\\[helm-generic-file-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
 helm-ggs-max-length-num-flag 0
 helm-ggs-max-length-real-flag 0
 helm-google-suggest-use-curl-p nil
 helm-grep-ack-types-cache nil
 helm-grep-help-message "== Helm Grep Map ==\nHelm Grep tips:\nYou can start grep with a prefix arg to recurse in subdirectories.\nYou can use wild card when selecting files (e.g *.el)\nYou can grep in many differents directories by marking files or wild cards.\nYou can save your results in a grep-mode buffer, see below.\n\n\nSpecific commands for Helm Grep:\n\\<helm-c-grep-map>\n\\[helm-c-goto-next-file]        ->Next File.\n\\[helm-c-goto-precedent-file]                ->Precedent File.\n\\[helm-yank-text-at-point]                ->Yank Text at point in minibuffer.\n\\[helm-c-grep-run-other-window-action]                ->Jump other window.\n\\[helm-c-grep-run-persistent-action]                ->Run persistent action (Same as `C-z').\n\\[helm-c-grep-run-default-action]                ->Run default action (Same as RET).\n\\[helm-c-grep-run-save-buffer]                ->Save to a `grep-mode' enabled buffer.\n\\[helm-grep-help]                ->Show this help.\n\n== Helm Map ==\n\\{helm-map}"
 helm-grep-in-recurse nil
 helm-grep-include-files nil
 helm-grep-last-cmd-line nil
 helm-grep-last-default-directory nil
 helm-grep-last-targets nil
 helm-grep-mode-abbrev-table [## 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0]
 helm-grep-mode-line-string "\\<helm-c-grep-map>\\[helm-grep-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
     helm-grep-mode-syntax-table #^[nil #^[(0) nil syntax-table
#^^[3 0 (1) (1) (1) (1) (1) (1) (1) (1) (1) (0) (0) (1) (0) (0) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (0) (1) (7) (1) (2) (2) (3) (1) (4 . 41) (5 . 40) (3) (3) (1) (3) (1) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1) (1) (3) (3) (3) (1) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 93) (9) (5 . 91) (1) (3) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 125) (3) (5 . 123) (1) (1)] #^^[1 0 #^^[2 0
#^^[3 0 (1) (1) (1) (1) (1) (1) (1) (1) (1) (0) (0) (1) (0) (0) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (0) (1) (7) (1) (2) (2) (3) (1) (4 . 41) (5 . 40) (3) (3) (1) (3) (1) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1) (1) (3) (3) (3) (1) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 93) (9) (5 . 91) (1) (3) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 125) (3) (5 . 123) (1) (1)]
#^^[3 128 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1) (1) (3) (3) (3) (2) (3) (1) (3) (3) (3) (4 . 187) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (5 . 171) (3) (3) (3) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 256 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2)
#^^[3 640 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (3) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2)
#^^[3 896 (2) (2) (2) (2) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2)
#^^[3 1408 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1) (2) (1) (2) (2) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)
#^^[3 3584 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 3712 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 3840 (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (2) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (2) (1) (1) (1) (1) (1) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1) (2) (1) (2) (1) (1) (1) (1) (1) (1) (1) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1)]
#^^[3 3968 (2) (2) (2) (2) (2) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]] #^^[2 4096 (2) (2) (2) (2) (2) (2)
#^^[3 4864 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1) (1) (1) (1) (1) (1) (1) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] #^^[2 8192
#^^[3 8192 (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (0) (1) (1) (1) (1) (3) (3) (3) (3) (3) (3) (3) (1) (1) (1) (1) (1) (1) (1) (1) (1) (3) (3) (3) (3) (3) (3) (3) (3) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (4 . 8262) (5 . 8261) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 8318) (5 . 8317) (3)]
#^^[3 8320 (2) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 8334) (5 . 8333) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 8448 (2) (2) (2) (3) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (2) (2) (2) (3) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 8576 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1)] (1) (1)
#^^[3 8960 (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (4 . 9002) (5 . 9001) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1)]
#^^[3 9088 (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (4 . 9141) (5 . 9140) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1) (1)]
#^^[3 9216 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3)]
#^^[3 9344 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 9472 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 9600 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (2) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (2) (2) (3) (3) (2) (2) (2) (2) (3) (3) (2) (2) (3) (3) (2) (2) (2) (2) (3) (3) (3) (2) (2) (3) (2) (2) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 9728 (2) (2) (2) (2) (2) (3) (3) (2) (2) (2) (2) (2) (2) (2) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (2) (3) (3) (3) (2) (3) (3) (3) (3) (2) (3) (3) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2)
#^^[3 9984 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 10089) (5 . 10088) (4 . 10091) (5 . 10090) (4 . 10093) (5 . 10092) (2) (2) (4 . 10097) (5 . 10096) (4 . 10099) (5 . 10098) (4 . 10101) (5 . 10100) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 10112 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 10215) (5 . 10214) (4 . 10217) (5 . 10216) (4 . 10219) (5 . 10218) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2)
#^^[3 10624 (2) (2) (2) (4 . 10628) (5 . 10627) (4 . 10630) (5 . 10629) (4 . 10632) (5 . 10631) (4 . 10634) (5 . 10633) (4 . 10636) (5 . 10635) (4 . 10638) (5 . 10637) (4 . 10640) (5 . 10639) (4 . 10642) (5 . 10641) (4 . 10644) (5 . 10643) (4 . 10646) (5 . 10645) (4 . 10648) (5 . 10647) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 10749) (5 . 10748) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] #^^[2 12288
#^^[3 12288 (3) (3) (3) (3) (2) (3) (3) (3) (4 . 12297) (5 . 12296) (4 . 12299) (5 . 12298) (4 . 12301) (5 . 12300) (4 . 12303) (5 . 12302) (4 . 12305) (5 . 12304) (3) (3) (4 . 12309) (5 . 12308) (4 . 12311) (5 . 12310) (4 . 12313) (5 . 12312) (4 . 12315) (5 . 12314) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 12416 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (3) (3) (2)] (2) (2)
#^^[3 12800 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (3) (3)] (2) (2)
#^^[3 13184 (3) (3) (3) (3) (3) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (3) (3) (2) (2) (3) (2) (2) (3) (2) (3) (2) (2) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] #^^[2 16384 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)
#^^[3 20096 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2)] (2) (2) (2) (2) (2) #^^[2 40960 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)
#^^[3 43648 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) #^^[2 61440 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)
#^^[3 64768 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 64831) (5 . 64830) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2)
#^^[3 65024 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 65078) (5 . 65077) (4 . 65080) (5 . 65079) (4 . 65082) (5 . 65081) (4 . 65084) (5 . 65083) (4 . 65086) (5 . 65085) (4 . 65088) (5 . 65087) (4 . 65090) (5 . 65089) (4 . 65092) (5 . 65091) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 65114) (5 . 65113) (4 . 65116) (5 . 65115) (4 . 65118) (5 . 65117) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2)
#^^[3 65280 (2) (3) (2) (3) (3) (3) (3) (2) (4 . 65289) (5 . 65288) (3) (3) (3) (2) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 65341) (3) (5 . 65339) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (4 . 65373) (3) (5 . 65371) (3) (4 . 65376) (5 . 65375) (1) (4 . 65379) (5 . 65378) (1) (1) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]
#^^[3 65408 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (2) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)]]] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) #^^[1 1114112 #^^[2 1114112 (3)
#^^[3 1114240 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2)
#^^[3 1114752 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3)]
#^^[3 1114880 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) #^^[1 1310720 #^^[2 1310720 (3)
#^^[3 1310848 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2)
#^^[3 1311360 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) #^^[2 1343488 (3) (3)
#^^[3 1343744 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) #^^[1 2555904 (2) (2) (2) (2) (2) (2) (2) (2) (2) #^^[2 2592768 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)
#^^[3 2596736 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3)]] #^^[2 2596864
#^^[3 2596864 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2)
#^^[3 2597120 (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3)] (3)
#^^[3 2597376 (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3)]
#^^[3 2597504 (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (3) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2)] (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2) (2)] syntax-table nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil]
     helm-grep-split-line-regexp "^\\([a-zA-Z]?:?[^:]*\\):\\([0-9]+\\):\\(.*\\)"
     helm-grep-use-zgrep nil
     helm-idle-delay 0.3
     helm-in-persistent-action nil
     helm-input ""
     helm-input-idle-delay 0.3
     helm-input-local ""
     helm-issued-errors nil
     helm-last-buffer "*helm mini*"
     helm-last-frame-or-window-configuration #<window-configuration>
     helm-last-log-file nil
     helm-last-sources '(((name . "multi-occur History")
                          (candidates lambda nil
                           (let ((all (helm-comp-read-get-candidates history test nil nil)))
                            (delete ""
                             (helm-fast-remove-dups (if (and default (not (string= default ""))) (delq nil (cons default (delete default all))) all) :test
                              (quote equal))
                             )
                            )
                           )
                          (filtered-candidate-transformer lambda (candidates sources)
                           (loop for i in candidates do (set-text-properties 0 (length i) nil i) collect i))
                          (persistent-action) (persistent-help . "DoNothing")
                          (mode-line .
                           "\\<helm-comp-read-map>\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct")
                          (action ("Sole action (Identity)" lambda (candidate) (if marked-candidates (helm-marked-candidates) (identity candidate)))))
                         ((name . "multi-occur")
                          (candidates lambda nil
                           (let ((cands (helm-comp-read-get-candidates collection test sort alistp))) (setq helm-cr-unknow-pattern-flag nil)
                            (unless
                             (or (eq must-match t) (string= helm-pattern "") (assoc helm-pattern cands) (assoc (intern helm-pattern) cands)
                              (member helm-pattern cands))
                             (setq cands (append (list helm-pattern) cands)) (setq helm-cr-unknow-pattern-flag t))
                            (if (and default (not (string= default ""))) (delq nil (cons default (delete default cands))) cands))
                           )
                          (filtered-candidate-transformer . helm-cr-default-transformer) (requires-pattern . 0) (persistent-action)
                          (persistent-help . "DoNothing")
                          (mode-line .
                           "\\<helm-comp-read-map>\\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-help]:Help \\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct")
                          (action ("Sole action (Identity)" lambda (candidate) (if marked-candidates (helm-marked-candidates) (identity candidate))))
                          (volatile))
                         )
     helm-last-sources-local '(helm-c-source-buffers-list helm-c-source-recentf helm-c-source-buffer-not-found)
     helm-let-variables nil
     helm-locate-case-fold-search 'smart
     helm-locate-create-db-command "updatedb -l 0 -o %s -U %s"
     helm-locate-db-file-regexp "m?locate.db$"
     helm-m-occur-idle-delay 0.3
     helm-m-occur-use-ioccur-style-keys t
     helm-maintainer-mail-address "emacs...@googlegroups.com"
     helm-marked-candidates nil
     helm-match-line-overlay nil
     helm-match-plugin-mode t
     helm-maybe-use-default-as-input nil
     helm-minibuffer-confirm-state nil
     helm-minibuffer-history-key "C-r"
     helm-moccur-always-search-in-current nil
     helm-moccur-help-message "== Helm Moccur Map ==\nHelm Moccur tips:\n\n\nSpecific commands for Helm Moccur:\n\\<helm-c-moccur-map>\n\\[helm-c-goto-next-file]        ->Next Buffer.\n\\[helm-c-goto-precedent-file]                ->Precedent Buffer.\n\\[helm-yank-text-at-point]                ->Yank Text at point in minibuffer.\n\\[helm-moccur-help]                ->Show this help.\n\n== Helm Map ==\n\\{helm-map}"
     helm-moccur-mode-line "\\<helm-c-moccur-map>\\[helm-moccur-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
     helm-mode t
     helm-mode-line-string '("Buffer(s)"
                             "\\<helm-c-buffer-map>\\[helm-c-buffer-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct" "String displayed in mode-line in `helm-c-source-buffers-list'")
     helm-mode-line-string-real "<C-return>:Empty C-h m:Help TAB:Act RET/C-e/C-j:NthAct"
     helm-move-selection-after-hook '(helm-maybe-update-keymap)
     helm-move-selection-before-hook nil
     helm-mp-1-pattern-real nil
     helm-mp-1-pattern-str nil
     helm-mp-2-pattern-real nil
     helm-mp-2-pattern-str nil
     helm-mp-3-pattern-list nil
     helm-mp-3-pattern-str ""
     helm-mp-default-match-functions '(helm-mp-exact-match helm-mp-3-match)
     helm-mp-default-search-backward-functions '(helm-mp-exact-search-backward helm-mp-3-search-backward)
     helm-mp-default-search-functions '(helm-mp-exact-search helm-mp-3-search)
     helm-mp-exact-pattern-real nil
     helm-mp-exact-pattern-str nil
     helm-mp-highlight-delay 0.7
     helm-mp-highlight-threshold 2
     helm-mp-matching-method 'multi3
     helm-mp-prefix-pattern-real nil
     helm-mp-prefix-pattern-str nil
     helm-mp-space-regexp "[\\ ] "
     helm-no-dump-variables '(helm-candidate-buffer-alist helm-help-message helm-candidate-cache)
     helm-occur-mode-line "\\<helm-map>\\[helm-help]:Help \\<helm-occur-map>\\[helm-occur-run-query-replace-regexp]:Query replace regexp \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
     helm-onewindow-p nil
     helm-outline-goto-near-line-flag t
     helm-outline-using nil
     helm-pattern ""
     helm-pdfgrep-help-message "== Helm PdfGrep Map ==\nSpecific commands for Pdf Grep:\n\\<helm-c-pdfgrep-map>\n\\[helm-c-goto-next-file]        ->Next File.\n\\[helm-c-goto-precedent-file]                ->Precedent File.\n\\[helm-yank-text-at-point]                ->Yank Text at point in minibuffer.\n\\[helm-pdfgrep-help]                ->Show this help.\n\n== Helm Map ==\n\\{helm-map}"
     helm-pdfgrep-mode-line-string "\\<helm-c-pdfgrep-map>\\[helm-pdfgrep-help]:Help \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
     helm-pdfgrep-targets nil
     helm-persistent-action-display-window nil
     helm-persistent-action-use-special-display nil
     helm-quick-update nil
     helm-quit nil
     helm-quit-if-no-candidate nil
     helm-raise-command nil
     helm-read-file-name-help-message "== Helm read file name Map ==\nSpecific commands for helm-c-read-file-name:\n\\<helm-c-read-file-map>\n\\[helm-find-files-down-one-level]                ->Go down precedent directory.\n\\[helm-ff-run-toggle-auto-update]        ->Toggle auto expansion of directories.\n\\[helm-next-source]        ->Goto next source.\n\\[helm-previous-source]        ->Goto previous source.\n\\[helm-read-file-name-help]                ->Display this help info.\n\n== Helm Map ==\n\\{helm-map}"
     helm-read-file-name-mode-line-string "\\<helm-c-read-file-map>\\[helm-read-file-name-help]:Help \\[helm-cr-empty-string]:Empty \\<helm-map>\\[helm-select-action]:Act \\[helm-exit-minibuffer]/\\[helm-select-2nd-action-or-end-of-line]/\\[helm-select-3rd-action]:NthAct"
     helm-restored-variables '(helm-candidate-number-limit helm-source-filter helm-source-in-each-line-flag helm-map helm-sources)
     helm-reuse-last-window-split-state nil
     helm-samewindow nil
     helm-save-configuration-functions '(set-window-configuration . current-window-configuration)
     helm-saved-action nil
     helm-saved-current-source nil
     helm-saved-selection "bash.org"
     helm-scroll-amount nil
     helm-select-action-hook nil
     helm-selection-overlay #<overlay from 21 to 28 in *helm-mode-multi-occur*>
     helm-selection-point 9
     helm-source-filter nil
     helm-source-in-each-line-flag nil
     helm-source-name nil
     helm-sources nil
     helm-sources-using-default-as-input '(helm-c-source-imenu helm-c-source-info-elisp helm-c-source-etags-select)
     helm-split-window-default-side 'below
     helm-split-window-in-side-p nil
     helm-split-window-preferred-function 'helm-split-window-default-fn
     helm-split-window-state 'horizontal
     helm-su-or-sudo "sudo"
     helm-surfraw-default-browser-function nil
     helm-surfraw-engines-history nil
     helm-surfraw-input-history nil
     helm-suspend-update-flag nil
     helm-time-zone-home-location "Paris"
     helm-tooltip-hide-delay 25
     helm-tramp-verbose 0
     helm-type-attributes '((file
                             (action ("Find file" . helm-find-many-files) ("Find file as root" . helm-find-file-as-root)
                              ("Find file other window" . find-file-other-window) ("Find file other frame" . find-file-other-frame)
                              ("Open dired in file's directory" . helm-c-open-dired) ("Grep File(s) `C-u recurse'" . helm-find-files-grep)
                              ("Zgrep File(s) `C-u Recurse'" . helm-ff-zgrep) ("Pdfgrep File(s)" . helm-ff-pdfgrep) ("Checksum File" . helm-ff-checksum)
                              ("Ediff File" . helm-find-files-ediff-files) ("Ediff Merge File" . helm-find-files-ediff-merge-files)
                              ("Etags `M-., C-u tap, C-u C-u reload tag file'" . helm-ff-etags-select) ("View file" . view-file)
                              ("Insert file" . insert-file) ("Delete file(s)" . helm-delete-marked-files)
                              ("Open file externally (C-u to choose)" . helm-c-open-file-externally)
                              ("Open file with default tool" . helm-c-open-file-with-default-tool) ("Find file in hex dump" . hexl-find-file))
                             (persistent-help . "Show this file") (action-transformer helm-c-transform-file-load-el helm-c-transform-file-browse-url)
                             (candidate-transformer helm-c-highlight-files helm-c-w32-pathname-transformer))
                            (buffer
                             (action ("Switch to buffer" . helm-c-switch-to-buffer) ("Switch to buffer other window" . switch-to-buffer-other-window)
                              ("Switch to buffer other frame" . switch-to-buffer-other-frame) ("Query replace regexp" . helm-c-buffer-query-replace-regexp)
                              ("Query replace" . helm-c-buffer-query-replace) ("View buffer" . view-buffer) ("Display buffer" . display-buffer)
                              ("Grep buffers (C-u grep all buffers)" . helm-c-zgrep-buffers) ("Multi occur buffer(s)" . helm-multi-occur-as-action)
                              ("Revert buffer(s)" . helm-revert-marked-buffers) ("Insert buffer" . insert-buffer)
                              ("Kill buffer(s)" . helm-kill-marked-buffers) ("Diff with file" . diff-buffer-with-file)
                              ("Ediff Marked buffers" . helm-ediff-marked-buffers)
                              ("Ediff Merge marked buffers" lambda (candidate) (helm-ediff-marked-buffers candidate t)))
                             (persistent-help . "Show this buffer") (filtered-candidate-transformer helm-c-skip-boring-buffers helm-c-highlight-buffers))
                            (bookmark (coerce . helm-bookmark-get-bookmark-from-name)
                             (action ("Jump to bookmark" . helm-c-bookmark-jump) ("Jump to BM other window" . bookmark-jump-other-window)
                              ("Bookmark edit annotation" . bookmark-edit-annotation) ("Bookmark show annotation" . bookmark-show-annotation)
                              ("Delete bookmark(s)" . helm-delete-marked-bookmarks) ("Rename bookmark" . bookmark-rename)
                              ("Relocate bookmark" . bookmark-relocate))
                             (keymap keymap (4 . helm-c-bookmark-run-delete)
                              (3 keymap (63 . helm-c-bookmark-help) (111 . helm-c-bookmark-run-jump-other-window)) keymap
                              (menu-bar keymap (help-menu keymap (describe keymap (describe-mode . helm-help)))) (help keymap (109 . helm-help))
                              (8 keymap (109 . helm-help) (104 . undefined) (8 . undefined)) (f1 keymap (109 . helm-help))
                              (20 lambda (&rest --cl-rest--) (interactive)
                               (apply (quote #[(G83212 G83213 G83214) "\303J        J\nJ#\207" [G83214 G83213 G83212 helm-run-multi-key-command] 4])
                                (quote --timeout--) (quote --iter--) (quote --funs--) --cl-rest--)
                               )
                              (C-tab . undefined) (67108897 . helm-toggle-suspend-update)
                              (3 keymap (24 keymap (2 . helm-send-bug-report-from-helm) (13 . helm-display-all-visible-marks) (4 . helm-debug-output))
                               (21 . helm-force-update) (6 . helm-follow-mode) (11 . helm-kill-selection-and-quit) (25 . helm-yank-selection)
                               (4 . helm-delete-current-selection) (45 . helm-swap-windows))
                              (67108987 . helm-enlarge-window) (67108989 . helm-narrow-window) (19 . undefined) (18 . undefined)
                              (23 . helm-yank-text-at-point) (24 keymap (6 . helm-quit-and-find-file)) (11 . helm-delete-minibuffer-contents)
                              (67108896 . helm-toggle-visible-mark) (C-M-up . helm-scroll-other-window-down) (C-M-down . helm-scroll-other-window)
                              (M-prior . helm-scroll-other-window-down) (M-next . helm-scroll-other-window) (12 . helm-recenter-top-bottom-other-window)
                              (15 . helm-next-source) (10 . helm-select-3rd-action) (5 . helm-select-2nd-action-or-end-of-line)
                              (26 . helm-execute-persistent-action) (9 . helm-select-action) (13 . helm-exit-minibuffer) (left . helm-previous-source)
                              (right . helm-next-source) (7 . helm-keyboard-quit) (22 . helm-next-page)
                              (27 keymap (110 . next-history-element) (112 . previous-history-element) (115 . undefined)
                               (1 . helm-show-all-in-this-source-only) (109 . helm-toggle-all-marks) (93 . helm-next-visible-mark)
                               (91 . helm-prev-visible-mark) (32 . helm-toggle-visible-mark) (33554454 . helm-scroll-other-window-down)
                               (25 . helm-scroll-other-window-down) (22 . helm-scroll-other-window) (12 . helm-reposition-window-other-window)
                               (62 . helm-end-of-buffer) (60 . helm-beginning-of-buffer) (118 . helm-previous-page))
                              (next . helm-next-page) (prior . helm-previous-page) (16 . helm-previous-line) (14 . helm-next-line)
                              (up . helm-previous-line) (down . helm-next-line) keymap (18 . helm-minibuffer-history)
                              (menu-bar keymap
                               (minibuf "Minibuf" keymap
                                (previous menu-item "Previous History Item" previous-history-element :help
                                 "Put previous minibuffer history element in the minibuffer")
                                (next menu-item "Next History Item" next-history-element :help "Put next minibuffer history element in the minibuffer")
                                (isearch-backward menu-item "Isearch History Backward" isearch-backward :help
                                 "Incrementally search minibuffer history backward")
                                (isearch-forward menu-item "Isearch History Forward" isearch-forward :help
                                 "Incrementally search minibuffer history forward")
                                (return menu-item "Enter" exit-minibuffer :key-sequence "" :help "Terminate input and exit minibuffer")
                                (quit menu-item "Quit" abort-recursive-edit :help "Abort input and exit minibuffer") "Minibuf")
                               )
                              (10 . exit-minibuffer) (13 . exit-minibuffer) (7 . minibuffer-keyboard-quit) (C-tab . file-cache-minibuffer-complete)
                              (9 . self-insert-command) (up . previous-history-element) (prior . previous-history-element) (down . next-history-element)
                              (next . next-history-element)
                              (27 keymap (114 . previous-matching-history-element) (115 . next-matching-history-element) (112 . previous-history-element)
                               (110 . next-history-element))
                              )
                             (mode-line . helm-bookmark-mode-line-string))
                            (file-line (filtered-candidate-transformer helm-c-filtered-candidate-transformer-file-line) (multiline)
                             (action ("Go to" . helm-c-action-file-line-goto)))
                            (line (display-to-real . helm-c-display-to-real-numbered-line) (action ("Go to Line" . helm-c-action-line-goto))))
     helm-types '(line file-line bookmark buffer file)
     helm-update-blacklist-regexps '("^" "^ *" "$" "!" " " "\\b" "\\<" "\\>" "\\<_" "\\>_")
     helm-update-hook '(helm-mp-highlight-match helm-revive-visible-mark)
     helm-visible-mark-overlays nil
     helm-yank-point nil
     helm-yank-symbol-first nil
     helm-zgrep-file-extension-regexp ".*\\(.gz\\|.bz\\|.xz\\|.lzma\\)$"
     ) 