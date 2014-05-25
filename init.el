;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; define the start time before loading no configuration
(defvar *emacs-load-start* (current-time))
(defun ginit ()
   "Go to Init.el"
   (interactive)
   (find-file "~/.emacs.d/init.el"))

(defun switch-to-minibuffer ()
  "Switch to minibuffer window."
  (interactive)
  (if (active-minibuffer-window)
      (select-window (active-minibuffer-window))
    (error "Minibuffer is not active")))

(defun rinit ()
   "Reload Init.el"
   (interactive)
   (load-file "~/.emacs.d/init.el"))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

(recentf-mode 1)
(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))

(require-package 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'buffers-with-submode-classes)
(setq mmm-submode-decoration-level 2)

(require 'init-markdown)
(require 'init-erlang)
(require 'init-javascript)
(require 'init-php)
(require 'init-nxml)
(require 'init-css)
(require 'init-python-mode)
(require 'init-haskell)
(require 'init-sql)

;;----------------------------------------------------------------------------
;; Allow users to load the custom function and miscellour settings
;;----------------------------------------------------------------------------
(require 'init-misc)
(require 'init-custom-function)
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
(global-set-key [C-S-f11] 'w32-restore-frame)
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
;;================================================================================
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
(require 'tabbar)
(tabbar-mode -1)
(global-set-key (kbd "<M-left>") 'tabbar-backward)
(global-set-key (kbd "<M-right>") 'tabbar-forward)
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
;;ibuffer
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(require 'ibuf-ext nil t)
(when (featurep 'ibuf-ext)
  (add-hook 'ibuffer-mode-hook (lambda ()
                                 (setq ibuffer-filter-groups '(
                                                               ("*buffer*" (name . "\\*.*\\*"))
                                                               ("TAGS" (name . "^TAGS\\(<[0-9]+>\\)?$"))
                                                               ("dired" (mode . dired-mode))
                                                               )))))
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "work")
             (add-to-list 'ibuffer-never-show-predicates "TAGS")
             (add-to-list 'ibuffer-never-show-predicates "^\\*.*")))
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-formats '( ;; ( mark modified read-only
                         ;; " " (mode 5 5 :left :elide)
                         ;; " " " " (name 35 -1 :left :elide)
                         ;; " " filename-and-process)
                         (mark modified read-only " " (name 35 -1 :left :elide))
                         (mark modified read-only " " (name 35 -1 :left :elide) " " " " filename-and-process)
                         (mark modified read-only " "
                               (name 35 -1 :left :elide)
                               " "
                               (mode 16 16 :left :elide)
                               " "
                               filename-and-process)
                         (mark modified read-only " "
                               (name 45 45 :left :elide)
                               " "
                               (size 9 -1 :right)
                               " "
                               (mode 16 16 :left :elide)
                               " " filename-and-process)))
(setq ibuffer-filter-group-name-face 'font-lock-doc-face)
;; =============================================================================
;; (set-face-attribute 'default nil
                    ;; :background "DarkSlateGray"
                    ;; :foreground "Wheat"
                    ;; )
;; (set-face-attribute  'menu nil
                     ;; :background "DarkSlateGray"
                     ;; :foreground "grey"
                     ;; :underline nil
                     ;; :slant 'normal
                     ;; )
;; (set-face-attribute 'font-lock-comment-face nil :foreground "#3f7f5f")
;; (set-face-attribute 'font-lock-comment-delimiter-face nil :foreground "#3f7f5f")

(require 'popwin)
(popwin-mode 1)
(defalias 'bkl 'bookmark-bmenu-list)
(defalias 'bks 'bookmark-set)
(defalias 'bkj 'bookmark-jump)
(defalias 'bkd 'bookmark-delete)
(defalias 'bcf 'byte-compile-file)

(autoload 'idomenu "idomenu" nil t)

;; ==============================================================================
(require-package 'kill-ring-search)
(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer."
  (interactive))
(global-set-key "\M-\C-y" 'kill-ring-search)
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
(require 'buffer-move)
(global-set-key (kbd "<C-M-up>")     'buf-move-up)
(global-set-key (kbd "<C-M-down>")   'buf-move-down)
(global-set-key (kbd "<C-M-left>")   'buf-move-left)
(global-set-key (kbd "<C-M-right>")  'buf-move-right)
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
;; =============================================================================
;; move the buffer
(autoload 'buffer-move "buffer-move")
(global-set-key (kbd "<C-M-up>")     'buf-move-up)
(global-set-key (kbd "<C-M-down>")   'buf-move-down)
(global-set-key (kbd "<C-M-left>")   'buf-move-left)
(global-set-key (kbd "<C-M-right>")  'buf-move-right)
;;==============================================================================
;; helm
(require-package 'helm)
(require 'init-helm)
(global-set-key "\C-co" 'occur)
(global-set-key "\C-l" 'bookmark-bmenu-list)
;;================================================================================
;; window move
(require 'windmove)
(global-set-key (kbd "ESC <left>")  'windmove-left)
(global-set-key (kbd "ESC <right>") 'windmove-right)
(global-set-key (kbd "ESC <up>")    'windmove-up)
(global-set-key (kbd "ESC <down>")  'windmove-down)
;;================================================================================
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
(global-set-key [f5] 'toggle-read-only)
(defalias 'qrr 'query-replace-regexp)
(defalias 'rs 'replace-string)
;;==============================================================================
(require-package 'csharp-mode)
(require-package 'powershell)
(add-to-list 'auto-mode-alist '("\\.[Pp][LlMm][Cc]?$" . cperl-mode))
(autoload 'powershell "powershell" "Run powershell as a shell within emacs." t)
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
;;(add-to-list 'auto-mode-alist '("\\.bat$" . batch-mode))
(add-to-list 'auto-mode-alist '("\\.script$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.cpp$" . (c++-mode 1)))
(add-to-list 'auto-mode-alist '("\\.h$" . (c++-mode 1)))
(add-to-list 'auto-mode-alist '("\\.py$" . (python-mode 1)))
(add-to-list 'auto-mode-alist '("\\.html$" . (html-mode 1)))
(add-to-list 'auto-mode-alist '("\\.htm$" . (html-mode 1)))
(add-to-list 'auto-mode-alist '("\\.ps1$" . (poweshell-mode 1)))
(add-to-list 'auto-mode-alist '("\\.cs$" . (csharp-mode 1)))
(add-to-list 'auto-mode-alist '("\\.csproj$" . (sgml-mode 1)))
(add-to-list 'auto-mode-alist '("\\.xml$" . (sgml-mode 1)))
;;(require 'dev-settings)

;; Usage M-x separe <RET> donne
;; 8<------8<------8<------8<------8<------8<------8<------8<------
(autoload (quote separe) "scissors" "Insert a line of SCISSORS in the buffer" t nil)

(require-package 'rainbow-mode)
(require 'rainbow-mode)
(define-globalized-minor-mode global-rainbow-mode
  rainbow-mode rainbow-turn-on
  :initialize 'custom-initialize-delay
  :init-value (not (or noninteractive emacs-basic-display))
  :group 'rainbow
  :version "24")
(global-rainbow-mode)
;;=============================================================================
(require-package 'projectile)
(require-package 'grizzl)
(require 'grizzl)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)

 (require 'highlight-indentation)
 (add-hook 'enh-ruby-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))
 (add-hook 'coffee-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))


(require 'flatui-theme)
(set-background-color "white")
;;=============================================================================
(require 'minimap-settings)

;; show time
(let* ((time (current-time))
       (low-sec (nth 1 time))
       (micro-sec (nth 2 time)))
  (message "load time: %dms"
           (/ (+ (* (- low-sec (nth 1 *emacs-load-start*)) 1000000)
                 (- micro-sec (nth 2 *emacs-load-start*))) 1000)))
(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
