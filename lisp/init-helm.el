(require 'helm-config)
(setq helm-input-idle-delay 0.1)
(global-set-key (kbd "C-b") 'helm-buffers-list)

(helm-mode 1)
(global-set-key (kbd "<f3>") 'helm-locate)
(require 'helm-files)
(define-key global-map "\C-z" 'helm-imenu)
(define-key global-map "\C-o" 'helm-find-files)
(define-key global-map "\C-xf" 'helm-find-files)
(setq helm-M-x-requires-pattern 0)
(require-package 'helm-gtags)
(helm-gtags-mode 1)
(setq enable-recursive-minibuffers t)
;;(helm-descbinds-mode)

;;;;;;;
;; ffap support. copied verbatim from helm-files.el at
;; https://github.com/emacs-helm/helm/blob/1fb1f6965ab36a9a13dc730bca1a8cfa1511f465/helm-files.el,
;; before it was removed in
;; https://github.com/emacs-helm/helm/commit/c4cad2a2c86c24acc89ce73424b474fc782b9b32
;;;;;;;
(eval-when-compile (require 'ffap))
(defvar helm-source-ffap-guesser
  `((name . "File at point")
    (init . (lambda () (require 'ffap)))
    (candidates . (lambda ()
                    (helm-aif
                        (with-helm-current-buffer
                          (ffap-guesser))
                        (list it))))
    (keymap . ,helm-generic-files-map)
    (help-message . helm-generic-file-help-message)
    (mode-line . helm-generic-file-mode-line-string)
    (action . ,(cdr (helm-get-attribute-from-type 'action 'file)))))

;;; ffap with line number
(defun helm-ffap-file-line-at-point ()
  "Get (FILENAME . LINENO) at point."
  (helm-aif (let (ffap-alist) (ffap-file-at-point))
      (save-excursion
        (forward-line 0)
        (when (and (search-forward it nil t)
                   (looking-at ":\\([0-9]+\\)"))
          (cons it (string-to-number (match-string 1)))))))

(defun helm-ffap-line-candidates ()
  (with-helm-current-buffer
    (helm-attrset 'ffap-line-location
                  (helm-ffap-file-line-at-point)))
  (helm-aif (helm-attr 'ffap-line-location)
      (loop for (file . line) in (list it) collect
            (cons (format "%s (line %d)" file line) file))))

;;; Goto line after opening file by `helm-source-ffap-line'.
(defun helm-ffap-line-goto-line ()
  (helm-aif (helm-attr 'ffap-line-location)
    (unwind-protect
         (ignore-errors
           (with-selected-window
               (get-buffer-window
                (get-file-buffer (car it)))
             (helm-goto-line (cdr it))))
      (helm-attrset 'ffap-line-location nil))))
(add-hook 'helm-after-action-hook 'helm-ffap-line-goto-line)
(add-hook 'helm-after-persistent-action-hook 'helm-ffap-line-goto-line)

(defvar helm-source-ffap-line
  `((name . "File/Lineno at point")
    (init . (lambda () (require 'ffap)))
    (candidates . helm-ffap-line-candidates)
    (keymap . ,helm-map)
    (action . ,(cdr (helm-get-attribute-from-type 'action 'file)))))
;;;;;;;
;; end copied ffap support
;;;;;;;

;; change a few keys:
;; TAB copies current item into minibuffer
(define-key helm-map [(tab)]
  (lambda () (interactive)
    (let* ((selection (car (split-string (helm-get-selection))))
           (buf (get-buffer selection)))
      (helm-set-pattern (if buf (buffer-file-name buf) selection)))))

;; C-TAB yanks current directory
(define-key helm-map [(control tab)]
  (lambda () (interactive) (helm-set-pattern (helm-current-directory))))

;; M-up and -down go to previous/next source
(define-key helm-map [(meta down)] 'helm-next-source)
(define-key helm-map (kbd "<M-up>") 'helm-previous-source)
;; unset left, right, and C-k
(define-key helm-map (kbd "<right>") nil)
(define-key helm-read-file-map (kbd "<right>") nil)
(define-key helm-map (kbd "<left>") nil)
(define-key helm-read-file-map (kbd "<left>") nil)
(define-key helm-map (kbd "C-k") nil)

(require 'helm-match-plugin)
(helm-match-plugin-mode 1)
;; only exact match, not regex. (this doesn't work. :/ )
(setq helm-mp-default-match-functions '(helm-mp-exact-match)
      helm-mp-default-search-functions '(helm-mp-exact-search)
      helm-mp-default-search-backward-functions '(helm-mp-exact-search-backward))

;; turn off network and other slow features in ffap, which slow down
;; helm-for-files when the thing under point looks like a url or domain.
;;
;; having (type . file) in a source can also lead to attempts to open network
;; connections. maybe because some entries look like tramp paths? who knows.
;; regardless, watch out for that.
(custom-set-variables
 '(ffap-alist nil)                ; faster, dumber prompting
 '(ffap-machine-p-known 'accept)  ; don't ping domains
 ; disable URLs, FTP, remote filesystems, etc. would set them to nil except
 ; that some fns like helm-find-files-get-candidates pass them directly to
 ; string-match, which complains.
 '(ffap-url-regexp nil)
 '(helm-ff-url-regexp "^$")       ; a helm variant
 '(ffap-ftp-regexp nil)
 '(ffap-ftp-sans-slash-regexp nil)
 '(ffap-rfs-regexp nil)
 '(ffap-shell-prompt-regexp nil)) ; disable shell prompt stripping

(defadvice ffap-guesser (after ffap-guesser-dont-return-root activate)
  "Don't return / or //, which happens if point is on a URL after the ://, or
  the empty string, which happens if point is on whitespace."
  (if (member ad-return-value '("/" "//" ""))
      (setq ad-return-value nil)))

(custom-set-variables
 '(helm-idle-delay 0.1)
 '(helm-input-idle-delay 0.1)
 '(helm-never-delay-on-input t)  ;; must be t on Mac OS X
 '(helm-yank-symbol-first t)
 '(helm-quick-update t)
 '(helm-full-frame nil)
 '(helm-locate-command "locate %s '%s'")
 '(helm-ff-auto-update-initial-value nil)
 ;; multi3 instead of strict so i can use multiple regexps separated by spaces.
 '(helm-mp-matching-method 'multi3)
 '(helm-buffer-max-length 50)
 ;; use file-name-history, not recentf
 '(helm-ff-file-name-history-use-recentf nil))

;; for multi-line items in e.g. minibuffer history, match entire items, not
;; individual lines within items.
;; https://groups.google.com/forum/?fromgroups=#!forum/emacs-helm
(require 'helm-misc)
(helm-attrset 'multiline nil helm-source-minibuffer-history)

(set-variable 'my-helm-for-files-preferred-list
   '(helm-source-ffap-line
     helm-source-ffap-guesser
     helm-source-buffers-list
     helm-source-files-in-current-dir
     helm-source-locate
     ;; This started automatically scrolling down past relative file path items
     ;; that didn't exist in the current directory, and kept doing that after
     ;; you tried to select them again with the arrow keys. Sometime before
     ;; 4/8/2013. Dropping helm-source-locate helped but instead it always
     ;; scrolled down past the first item. So, disable it for now and use C-x
     ;; C-f for creating a new file.
     ;; helm-source-find-files
))

;; don't match on buffer major mode
(setq helm-source-buffers-list
      (assq-delete-all 'match helm-source-buffers-list))

;; use the helm-find-files-map keymap
(defun my-helm-for-files ()
  (interactive)
  ;; unset any remote/tramp dir, since it makes helm try to ssh
  (let ((default-directory
          (if (file-remote-p default-directory) "/tmp" default-directory)))
    (helm :sources my-helm-for-files-preferred-list
          :buffer "*helm for files*")))

(helm-mode 1)
(define-key global-map [(control f)] 'my-helm-for-files)

;; disable helm-mode for write-file, rename-[this-]file, and delete-file
(setq helm-completing-read-handlers-alist
      (append helm-completing-read-handlers-alist
              '((write-file . read-file-name)
                (rename-file . read-file-name)
                (rename-this-file . read-file-name)
                (delete-file . read-file-name))))

(defadvice helm-exit-minibuffer (before save-to-file-name-history activate)
  "If helm selected a filename, save it to file-name-history."
  (let ((file (helm-get-selection)))
    (when (and file (file-exists-p file) (file-name-absolute-p file))
      (message "Adding to file-name-history: %s" file)
      (add-to-list 'file-name-history file))))
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
 helm-after-action-hook '(helm-ffap-line-goto-line helm-files-save-file-name-history)
 helm-after-initialize-hook '(helm-reset-yank-point helm-clear-visible-mark)
 helm-after-persistent-action-hook '(helm-ffap-line-goto-line helm-reset-yank-point helm-match-line-update)
 helm-after-update-hook '( helm-ff-maybe-mark-candidates helm-ff-auto-expand-to-home-or-root
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
 )

(global-set-key (kbd "C-c g")                   'helm-google-suggest)
(global-set-key (kbd "C-M-s") 'helm-occur)
(global-set-key (kbd "C-M-r") 'helm-regexp) ;; sinimar with helm-occur,but regex
(global-set-key (kbd "C-M-f") 'helm-do-grep) ;; grep from the current folder
(global-set-key (kbd "C-h m") 'helm-all-mark-rings) ;; show all marked string, what is marked?
(global-set-key (kbd "C-h C-h") 'helm-M-x);; show all commmands of emacs
(global-set-key (kbd "C-c C-f") 'indent-region)
(push '(dired-mode :position top) popwin:special-display-config)
;; (push "*helm-mode-find-file*" popwin:special-display-config)
;; (push "*helm-mode-execute-extended-command*" popwin:special-display-config)
;; (push "*Helm Find Files*" popwin:special-display-config)
;; (push "*helm occur*" popwin:special-display-config)
;; (push "*Bookmark List*" popwin:special-display-config)
(push "*helm pcomplete*" popwin:special-display-config)
(push "*Backtrace*" popwin:special-display-config)
(push '("\*.*[h|H]elm.*\*" :regexp t :height 15) popwin:special-display-config)

(loop for ext in '("\\.swf$" "\\.elc$" "\\.pyc$")
      do (add-to-list 'helm-boring-file-regexp-list ext))

(provide 'init-helm)
