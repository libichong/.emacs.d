(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'exec-path (getenv "path"))
(defconst my-emacs-path           "~/.emacs.d/"                          "my emacs root path")
(defconst my-emacs-lisps-path     (concat my-emacs-path "lisps/")        "my emacs root")


;; define the start time before loading no configuration
(defvar *emacs-load-start* (current-time))

(defun ginit ()
   "Go to Init.el"
   (interactive)
   (find-file "~/.emacs.d/init.el"))

(defun gominibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(defun rinit ()
   "Reload Init.el"
   (interactive)
   (load-file "~/.emacs.d/init.el"))

;; Must come before elpa, as it may provide package.el
(require 'init-site-lisp)

;; Machinery for installing required packages
(require 'init-elpa)

;;----------------------------------------------------------------------------
;; Allow users to load the custom function and miscellour settings
;;----------------------------------------------------------------------------
(require 'init-misc)
(require 'init-function)

;;----------------------------------------------------------------------------
;; Locales (setting them earlier in this file doesn't work in X)
;;----------------------------------------------------------------------------
(require 'init-locales)

;;==============================================================================
;; window number
(require-package 'window-number)
(autoload 'window-number-mode "window-number"
  "A global minor mode that enables selection of windows according to
 numbers with the C-x C-j prefix.  Another mode,
 `window-number-meta-mode' enables the use of the M- prefix."
  t)
;;=============================================================================
(require-package 'auto-complete)
(require 'auto-complete-settings)

;; =============================================================================
(require 'bm)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)
;; =============================================================================
(require-package 'browse-kill-ring)
(require 'browse-kill-ring)
;; =============================================================================
(require-package 'goto-chg)
(require 'goto-chg)
(global-set-key (kbd "C-x C-l") 'goto-last-change)
(global-set-key "\C-j" 'goto-line)

;;================================================================================
;;maximize the emacs in the last line, otherwise it won't work.
(defun w32-restore-frame ()
  "Restore a minimized frame"
  (interactive)
  (w32-send-sys-command 61728))

(defun w32-maximize-frame ()
  "Maximize the current frame"
  (interactive)
  (w32-send-sys-command 61488))
(run-with-idle-timer 1 nil 'w32-send-sys-command 61488)
(add-hook 'window-setup-hook 'w32-maximize-frame t)
(autoload 'w32-fullscreen "w32-fullscreen")
(global-set-key [C-S-f11] 'w32-fullscreen)
(global-set-key [C-f11] 'w32-maximize-frame)
;;(global-set-key [C-S-f11] 'w32-restore-frame)

;;================================================================================
;;dired plus
(require-package 'dired+)
(require 'dired+)
(toggle-diredp-find-file-reuse-dir 1)
;;==============================================================================
(autoload 'speedbar-frame-mode "speedbar" "Popup a speedbar frame" t)
(autoload 'speedbar-get-focus "speedbar" "Jump to speedbar frame" t)
(global-set-key [(f4)] 'speedbar)
;;==============================================================================
;; highlight-symbol
(setq highlight-symbol-colors
      '( "DeepPink" "cyan" "MediumPurple1" "SpringGreen1"
         "DarkOrange" "HotPink1" "RoyalBlue1" "OliveDrab"))
(autoload 'highlight-symbol-at-point "highlight-symbol")
(autoload 'highlight-symbol-next "highlight-symbol")
(autoload 'highlight-symbol-prev "highlight-symbol")
(autoload 'highlight-symbol-query-replace "highlight-symbol")
(global-set-key [(control f8)] 'highlight-symbol-at-point)
(global-set-key [f8] 'highlight-symbol-next)
(global-set-key [(shift f8)] 'highlight-symbol-prev)
(global-set-key [(meta f8)] 'highlight-symbol-query-replace)
;;==============================================================================
;;ido mode
(when (require 'ido "ido.elc" t) ;;Part of emacs22
  ;; C-tab ou C-x b pour changer de buffer
  (global-set-key (kbd "<C-tab>") 'ido-switch-buffer)
  (setq ido-case-fold t)
  (ido-mode t)
  (setq ido-enable-dot-prefix t)
  (setq ido-auto-merge-delay-time 9);;the time here is in seconds. I could set a very large number to completely disable this feature. I do C-x C-f my_file and if it doesn't exist in current directory, emacs will try to search for it in other recent used directories in about a second. However, most of the time I was just trying to create new files.
  ;;(setq ido-auto-merge-work-directories-length -1)
  (setq ido-default-file-method 'selected-window)
  (setq ido-enable-flex-matching t
        ido-auto-merge-work-directories-length -1
        ido-create-new-buffer 'always
        ido-everywhere t
        ido-default-buffer-method 'selected-window
        ido-max-prospects 32
        ido-use-filename-at-point 'guess
        )
  (setq ido-ignore-files
        (append ido-ignore-files
                (list
                 "NTUSER.*"
                 "Thumbs.db"
                 "$RECYCLE.BIN"
                 ".*\\.aux$"
                 ".*\\.dvi$"
                 ".*\\.ps$"
                 ".*\\.eps$"
                 ".*\\.toc$"
                 ".*\\.nav$"
                 ".*\\.pdf$"
                 ".*\\.gif$"
                 ".*\\.png$"
                 ".*~$")))

  (setq ido-ignore-buffers
        (append ido-ignore-buffers
                (list
                 "\\*BBDB\\*"))))
;;================================================================================
(require 'popwin)
(popwin-mode 1)
(defalias 'bkl 'bookmark-bmenu-list)
(defalias 'bks 'bookmark-set)
(defalias 'bkj 'bookmark-jump)
(defalias 'bkd 'bookmark-delete)
(defalias 'bcf 'byte-compile-file)
(global-set-key "\C-l" 'bookmark-bmenu-list)

(require-package 'layout-restore)
(require 'layout-restore)
(defalias 'lc 'layout-save-current)
(defalias 'lr 'layout-restore)
(defalias 'ld 'layout-delete-current)
(autoload 'idomenu "idomenu" nil t)
;; ==============================================================================
(require-package 'kill-ring-search)
(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer."
  (interactive))
(global-set-key "\M-\C-y" 'kill-ring-search)
;;================================================================================
(require 'whitespace)
(setq whitespace-style '(face tabs tab-mark space-before-tab trailing))
(global-whitespace-mode 1)
(global-auto-revert-mode 1)
;;================================================================================
(add-hook 'server-visit-hook 'call-raise-frame)
(defun call-raise-frame ()
  (raise-frame))

(require 'server)
(defun server-ensure-safe-dir (dir) t)
(server-start)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)
;================================================================================
(require-package 'w3m)
(require 'w3m)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.bing.com")
(setq w3m-coding-system 'utf-8
          w3m-file-coding-system 'utf-8
          w3m-file-name-coding-system 'utf-8
          w3m-input-coding-system 'utf-8
          w3m-output-coding-system 'utf-8
          w3m-terminal-coding-system 'utf-8)
;;================================================================================
(require-package 'rainbow-mode)
(require 'rainbow-mode)
(define-globalized-minor-mode global-rainbow-mode
  rainbow-mode rainbow-turn-on
  :initialize 'custom-initialize-delay
  :init-value (not (or noninteractive emacs-basic-display))
  :group 'rainbow
  :version "24")
(global-rainbow-mode)
(require 'dev-settings)
(delete-selection-mode 1)

;;================================================================================
;; helm basic
(require-package 'helm)
(require 'helm-config)
(helm-mode 1)
(setq helm-input-idle-delay 0.1)
(setq helm-exit-idle-delay 0)
(setq helm-M-x-requires-pattern 0)

(require-package 'helm-gtags)
(helm-gtags-mode 1)
(setq enable-recursive-minibuffers t)

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

(require 'helm-files)
(global-set-key (kbd "C-b") 'helm-buffers-list)
(global-set-key (kbd "<f3>") 'helm-locate)
(define-key global-map "\C-z" 'helm-imenu)
(define-key global-map "\C-f" 'helm-find-files)
(global-set-key (kbd "C-c g")                   'helm-google-suggest)
(global-set-key (kbd "C-M-s") 'helm-occur)
(global-set-key (kbd "C-M-r") 'helm-regexp) ;; sinimar with helm-occur,but regex
(global-set-key (kbd "C-M-f") 'helm-do-grep) ;; grep from the current folder
(global-set-key (kbd "C-h m") 'helm-all-mark-rings) ;; show all marked string, what is marked?
(global-set-key (kbd "C-h C-h") 'helm-M-x);; show all commmands of emacs
(global-set-key (kbd "C-c C-f") 'indent-region)
;;===============================================================================
;; helm-swoop
(require-package 'helm-swoop)
(require 'helm-swoop)

;; Change the keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

;; When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;; When doing evil-search, hand the word over to helm-swoop
;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; If this value is t, split window inside the current window
(setq helm-swoop-split-with-multiple-windows nil)

;; Split direcion. 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)

;; If nil, you can slightly boost invoke speed in exchange for text color
(setq helm-swoop-speed-or-color nil)

;;================================================================================
;; move the buffer
(autoload 'buffer-move "buffer-move")
(global-set-key (kbd "<C-M-up>")     'buf-move-up)
(global-set-key (kbd "<C-M-down>")   'buf-move-down)
(global-set-key (kbd "<C-M-left>")   'buf-move-left)
(global-set-key (kbd "<C-M-right>")  'buf-move-right)
;;===============================================================================
;; window move
(require 'windmove)
(global-set-key (kbd "ESC <left>")  'windmove-left)
(global-set-key (kbd "ESC <right>") 'windmove-right)
(global-set-key (kbd "ESC <up>")    'windmove-up)
(global-set-key (kbd "ESC <down>")  'windmove-down)

;;=============================================================================
;;global key binding
(global-set-key [(super backspace)] '(lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key [(meta down)] 'comment-and-go-down)
(global-set-key [(meta up)] 'uncomment-and-go-up)
(global-set-key [(super return)] 'find-file-at-point)
(global-set-key [(control return)] 'dired-jump)
(global-set-key [(meta k)] 'bc-kill-whole-line)
(global-set-key [f1] 'undo)
(global-set-key [S-f1] 'redo)
(global-set-key [(meta y)] 'browse-kill-ring)
;; read only while open file.
;; (add-hook 'find-file-hook
          ;; '(lambda ()
             ;; (when (and (buffer-file-name)
                        ;; (file-exists-p (buffer-file-name))
                        ;; (file-writable-p (buffer-file-name)))
               ;; (message "Toggle to read-only for existing file")
               ;; (toggle-read-only 1)
               ;; (view-mode))))
(global-set-key [f12] 'save-buffer)
(global-set-key [f6] 'toggle-read-only)
(global-set-key (kbd "<f7>") 'recentf-open-files)
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(global-set-key [f5] 'revert-buffer-no-confirm)
(defalias 'qrr 'query-replace-regexp)
(defalias 'rs 'replace-string)
;;3================================================================================
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(add-to-list 'auto-mode-alist '("\\.cpp$" . (c++-mode 1)))
(add-to-list 'auto-mode-alist '("\\.h$" . (c++-mode 1)))
(add-to-list 'auto-mode-alist '("\\.cs$" . (csharp-mode 1)))
(add-to-list 'auto-mode-alist '("\\.csproj$" . (sgml-mode 1)))
(add-to-list 'auto-mode-alist '("\\.xml$" . (sgml-mode 1)))
(add-to-list 'auto-mode-alist '("\\.html$" . (html-mode 1)))
(add-to-list 'auto-mode-alist '("\\.htm$" . (html-mode 1)))
(add-to-list 'auto-mode-alist '("\\.[Pp][LlMm][Cc]?$" . cperl-mode))

(require-package 'json-reformat)
(require 'json-reformat)
(require-package 'powershell)
(require 'powershell)

(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")
;;===============================================================================
;; show time
(let* ((time (current-time))
       (low-sec (nth 1 time))
       (micro-sec (nth 2 time)))
  (message "load time: %dms"
           (/ (+ (* (- low-sec (nth 1 *emacs-load-start*)) 1000000)
                 (- micro-sec (nth 2 *emacs-load-start*))) 1000)))
(provide 'init)
