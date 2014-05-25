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

;; 个人信息
(setq user-mail-address "bichongl@microsoft.com")
(setq user-full-name    "bichongl")

;; 在fringe上显示一个小箭头指示当前buffer的边界
(setq-default indicate-buffer-boundaries 'left)

;; 尽快显示按键序列
(setq echo-keystrokes 0.1)

(setq system-time-locale "C")

;; 不要滚动条
(customize-set-variable 'scroll-bar-mode nil)

;; 支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)

;; Emacs找不到合适的模式时，缺省使用text-mode
(setq default-major-mode 'text-mode)

;; 显示列号
(setq column-number-mode t)

(setq-default show-trailing-whitespace t)
(setq-default show-leading-whitespace t)
;; la face utilisée pour les espaces inutiles.
(set-face-attribute 'trailing-whitespace nil
                    :background "#2F4545")

;; emacs lock
(autoload 'toggle-emacs-lock "emacs-lock" "Emacs lock" t)

;; 启用以下功能
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)

;; 不显示Emacs的开始画面
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; Make all yes-or-no questions as y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;; 不要闪烁光标, 烦不烦啊
(blink-cursor-mode -1)


;; 防止页面滚动时跳动,scroll-margin 3可以在靠近屏幕边沿3行时就开始滚动,可以很好的看到上下文
(setq scroll-margin 3
      scroll-conservatively 10000)

;; 没有提示音,也不闪屏
(setq ring-bell-function 'ignore)

;; 可以递归的使用minibuffer
(setq enable-recursive-minibuffers t)

;; 当你在shell、telnet、w3m等模式下时，必然碰到过要输入密码的情况,此时加密显出你的密码
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
(set-face-attribute 'default nil :family "Consolas" :height 110)
;; Chinese Font
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "Microsoft YaHei" :size 15)))

;; inhibit the startup message
(setq inhibit-startup-message t)

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

;; Òþ²Ø¹ö¶¯Ìõ
(scroll-bar-mode -1)

(mouse-avoidance-mode 'animate)
;; ²»ÒªÔÚÊó±ê¹â±ê´¦²åÈë

(put 'scroll-left 'disabled nil);;ÔÊÐíÆÁÄ»×óÒÆ
(put 'scroll-right 'disabled nil);;ÔÊÐíÆÁÄ»ÓÒÒÆ
(put 'set-goal-column 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq mouse-yank-at-point t)

;; share the clipboard with external program
(setq x-select-enable-clipboard t)

(set-frame-height nil 46)
(set-frame-width nil 124)

;; stop to blink the cursor
(blink-cursor-mode t)
;; ¸ßÁÁ¶ÈÏÔÊ¾Ñ¡ÖÐÇøÓò
(transient-mark-mode 1)

;;the maxmium size of kill ring
(setq kill-ring-max 200)

;; alert while load large file
(setq large-file-warning-threshold 4000000)

;; don't create backup file
(setq-default make-backup-files nil)

;; delete and copy directory recursively
(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; color-theme
(require 'molokai-theme)

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
(set-cursor-color "red")

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

(global-set-key (kbd "C-c b") 'browse-url-at-point)

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

(provide 'init-misc)
