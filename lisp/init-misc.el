;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-08-28 22:38:00 Saturday by taoshanwen>

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

;; personal informatio
(setq user-mail-address "bichongl@microsoft.com")
(setq user-full-name    "bichongl")

;; 在fringe上显示一个小箭头指示当前buffer的边界
(setq-default indicate-buffer-boundaries 'left)

;; 尽快显示按键序列
(setq echo-keystrokes 0.1)

(setq system-time-locale "C")

;; disable scroll bar
(customize-set-variable 'scroll-bar-mode nil)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; Emacs找不到合适的模式时，缺省使用text-mode
(setq default-major-mode 'text-mode)

;; 显示列号
(setq column-number-mode t)

(setq redisplay-dont-pause t)

(setq-default show-trailing-whitespace t)
(setq-default show-leading-whitespace t)
;; la face utilisée pour les espaces inutiles.
(set-face-attribute 'trailing-whitespace nil
                    :background "#2F4545")

;; emacs lock
(autoload 'toggle-emacs-lock "emacs-lock" "Emacs lock" t)

(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; inhibit the startup message
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Make all yes-or-no questions as y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; disable blink cursor
(blink-cursor-mode t)


;; 防止页面滚动时跳动,scroll-margin 3
;;可以在靠近屏幕边沿3行时就开始滚动,可以很好的看到上下文
(setq scroll-margin 3
      scroll-conservatively 10000)

;; no ring bell
(setq ring-bell-function 'ignore)

;; 可以递归的使用minibuffer
(setq enable-recursive-minibuffers t)

;; show the pwd as *
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)

;; 可以保存你上次光标所在的位置
(require 'saveplace)
(setq-default save-place t)

;; 光标靠近鼠标指针时，让鼠标指针自动让开，别挡住视线。
(mouse-avoidance-mode 'animate)

;; don't save the duplicate kill string
(setq kill-do-not-save-duplicates t)

;; first format, then indent
(setq tab-always-indent 'complete)

(setq compilation-ask-about-save nil)

(setq compilation-window-height 12)

(setq compilation-scroll-output t)

;; (when (string= user-real-login-name "pi")
;;(menu-bar-mode -1)
;;(global-set-key (kbd "<C-f1>") 'menu-bar-mode)

(setq ompletion-ignore-case t)

(setq read-file-name-completion-ignore-case t)

(global-linum-mode t); always show line numbers

(setq-default indent-tabs-mode nil)
(setq tab-witdth 4)
(setq-default tab-width 4)

;; (setq frame-title-format "bichongl@microsoft.com")
;; (setq frame-title-format (list user-real-login-name "@" system-name " : %S" 'default-directory "%b"))
;;(setq-default frame-title-format "%b %f")
;;(setq frame-title-format (list "%f"))
(setq frame-title-format
          '(buffer-file-name
            "%f"
            (dired-directory dired-directory "%b")))
;;(setq frame-title-format '("%b (" (:eval (directory-file-name (file-name-directory (abbreviate-file-name (buffer-file-name))))) ") - Bichong Li"))
(setq default-fill-column 80);

(display-time-mode 1)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-use-mail-icon t)
(setq display-time-interval 10)

;;中文与外文字体设置
;; Setting English Font
(set-face-attribute 'default nil :family "Consolas" :height 100)
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "Microsoft YaHei" :size 11)))

;; hilight syntax
(global-font-lock-mode t)


(auto-image-file-mode t)
(autoload 'thumbs "thumbs" "Preview images in a directory." t)

(column-number-mode t)

(show-paren-mode t)

(tool-bar-mode -1)

(menu-bar-mode 0)

(setq sentence-end
      "\\([¡££¡£¿]\\|¡­¡­\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")

(scroll-bar-mode -1)

(mouse-avoidance-mode 'animate)

(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq mouse-yank-at-point t)

;; share the clipboard with external program
(setq x-select-enable-clipboard t)

(set-frame-height nil 46)
(set-frame-width nil 124)

;; stop to blink the cursor
(transient-mark-mode 1)

;;the maxmium size of kill ring
(setq kill-ring-max 200)

;; alert while load large file
(setq large-file-warning-threshold 400000000)

;; don't create backup file
(setq-default make-backup-files nil)

;; delete and copy directory recursively
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(global-auto-revert-mode t)

(setq w32-pass-lwindow-to-system nil) ;; prevent single keypress from activating Start Menu
(setq w32-lwindow-modifier 'nil)      ;; make sure it's not used as a modifier


(define-key key-translation-map (kbd "<lwindow>") 'event-apply-super-modifier)
(define-key key-translation-map (kbd "<apps>") 'event-apply-alt-modifier)
;;(add-hook 'after-init-hook 'split-window-horizontally)

(defalias 'sifn 'substitute-in-file-name)
;; For Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)


(setq-default cursor-type 'box)
(set-cursor-color "goldenrod")


(setq w32-pass-lwindow-to-system nil
      w32-pass-rwindow-to-system nil
      w32-pass-apps-to-system nil
      w32-capslock-is-shiftlock nil
      w32-enable-caps-lock nil
      w32-lwindow-modifier 'super ;; Left Windows key
      w32-rwindow-modifier 'alt
      w32-recognize-altgr nil
      w32-apps-modifier 'hyper
      )

;; autosave subdir
(setq backup-directory-alist '(("." . "~/.autosave")))

(global-hl-line-mode 1)
;;(set-face-background 'hl-line "CornflowerBlue")

;; don't let the cursor go into minibuffer prompt
(setq minibuffer-prompt-properties (quote (read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt)))

(defun stop-using-minibuffer ()
  "kill the minibuffer"
  (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)
(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq inhibit-splash-screen t)

(setq exec-path (add-to-list 'exec-path "C:/Users/bichongl/.babun/cygwin/bin"))
;;(setenv "PATH" (concat "C:/Users/bichongl/.babun/cygwin/bin;" (getenv "PATH")))
;; (global-set-key [(f8)] 'loop-alpha)
;; (setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))
;; (defun loop-alpha ()
  ;; (interactive)
  ;; (let ((h (car alpha-list)))
    ;; ((lambda (a ab)
       ;; (set-frame-parameter (selected-frame) 'alpha (list a ab))
       ;; (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))
       ;; ) (car h) (car (cdr h)))
    ;; (setq alpha-list (cdr (append alpha-list (list h))))
    ;; )
;; )

(defun sanityinc/utf8-locale-p (v)
  "Return whether locale string V relates to a UTF-8 locale."
  (and v (string-match "UTF-8" v)))

(defun locale-is-utf8-p ()
  "Return t iff the \"locale\" command or environment variables prefer UTF-8."
  (or (sanityinc/utf8-locale-p (and (executable-find "locale") (shell-command-to-string "locale")))
      (sanityinc/utf8-locale-p (getenv "LC_ALL"))
      (sanityinc/utf8-locale-p (getenv "LC_CTYPE"))
      (sanityinc/utf8-locale-p (getenv "LANG"))))

(when (or window-system (locale-is-utf8-p))
  (setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (unless (eq system-type 'windows-nt)
   (set-selection-coding-system 'utf-8))
  (prefer-coding-system 'utf-8))

(defun pi-toggle-font()
  "Toggle between large and small font."
  (interactive)
  (if (string= pi-current-font-size "small")
      (progn
        (set-frame-font pi-big-font t)
        (setq pi-current-font-size "big"))
    (progn
      (set-frame-font pi-small-font t)
      (setq pi-current-font-size "small"))))

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

(defvar mode-line-cleaner-alist
  `((auto-complete-mode . "")
    (yas/minor-mode . " υ")
    (paredit-mode . " π")
    (eldoc-mode . "")
    (abbrev-mode . "")
    (undo-tree-mode . "")
    (anzu-mode . "")
    (global-whitespace-mode . "")
    ;; Major modes
    (lisp-interaction-mode . "λ")
    (hi-lock-mode . "")
    (python-mode . "Py")
    (emacs-lisp-mode . "Lisp")
    (helm-mode . "Helm")
    (which-key-mode . "")
    (nxhtml-mode . "nx"))
  "Alist for `clean-mode-line'.

When you add a new element to the alist, keep in mind that you
must pass the correct minor/major mode symbol and a string you
want to use in the modeline *in lieu of* the original.")


(defun clean-mode-line ()
  (interactive)
  (loop for cleaner in mode-line-cleaner-alist
        do (let* ((mode (car cleaner))
                 (mode-str (cdr cleaner))
                 (old-mode-str (cdr (assq mode minor-mode-alist))))
             (when old-mode-str
                 (setcar old-mode-str mode-str))
               ;; major mode
             (when (eq mode major-mode)
               (setq mode-name mode-str)))))


(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;;; alias the new `flymake-report-status-slim' to
;;; `flymake-report-status'
(defalias 'flymake-report-status 'flymake-report-status-slim)
(defun flymake-report-status-slim (e-w &optional status)
  "Show \"slim\" flymake status in mode line."
  (when e-w
    (setq flymake-mode-line-e-w e-w))
  (when status
    (setq flymake-mode-line-status status))
  (let* ((mode-line " Φ"))
    (when (> (length flymake-mode-line-e-w) 0)
      (setq mode-line (concat mode-line ":" flymake-mode-line-e-w)))
    (setq mode-line (concat mode-line flymake-mode-line-status))
    (setq flymake-mode-line mode-line)
    (force-mode-line-update)))
;;(require 'recentf)
;; (recentf-mode t)
;; (defun revert-buffer-no-confirm ()
  ;; "Revert buffer without confirmation."
  ;; (interactive) (revert-buffer t t))

(winner-mode t)
(global-set-key (kbd "<f10>")   'winner-undo)
(global-set-key (kbd "<S-f10>") 'winner-redo)

;;global key binding
(global-set-key [(super backspace)] '(lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key [(meta down)] 'comment-and-go-down)
(global-set-key [(meta up)] 'uncomment-and-go-up)
(global-set-key [(super return)] 'find-file-at-point)
(global-set-key [(control return)] 'dired-jump)
(global-set-key [(meta k)] 'bc-kill-whole-line)
(global-set-key [f12] 'save-buffer)
(global-set-key [f5] 'toggle-read-only)
(global-set-key [f6] 'revert-buffer-no-confirm)
;;(global-set-key (kbd "<f7>") 'recentf-open-files)
(global-set-key "\C-l" 'bookmark-bmenu-list)
(global-set-key (kbd "C-c C-f") 'indent-region)
(defalias 'qrr 'query-replace-regexp)
(defalias 'rs 'replace-string)
(defalias 'bkl 'bookmark-bmenu-list)
(defalias 'bks 'bookmark-set)
(defalias 'bkj 'bookmark-jump)
(defalias 'bkd 'bookmark-delete)
(defalias 'bcf 'byte-compile-file)
(defalias 'cc 'calc)
(defalias 'sh 'shell)
(defalias 'ps 'powershell)
(defalias 'rf 'recentf-open-files)
(defalias 'lcd 'list-colors-display)

(provide 'init-misc)
