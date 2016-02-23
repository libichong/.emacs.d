;;run M-x esup, and watch the magic happen.
(require-package 'esup)
(require 'esup)
;;==============================================================================
;; window number
(require-package 'window-number)
(autoload 'window-number-mode "window-number"
  "A global minor mode that enables selection of windows according to
 numbers with the C-x C-j prefix.  Another mode,
 `window-number-meta-mode' enables the use of the M- prefix."
  t)
;;=============================================================================
;; (require-package 'auto-complete)
;; (require 'auto-complete-settings)

(require-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

(require 'bm)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

(require-package 'browse-kill-ring)
(require 'browse-kill-ring)
(global-set-key [(meta y)] 'browse-kill-ring)

;;dired plus
(require-package 'dired+)
(require 'dired+)
(toggle-diredp-find-file-reuse-dir 1)

(require 'popwin)
(popwin-mode 1)
(defalias 'bkl 'bookmark-bmenu-list)
(defalias 'bks 'bookmark-set)
(defalias 'bkj 'bookmark-jump)
(defalias 'bkd 'bookmark-delete)
(defalias 'bcf 'byte-compile-file)

(require 'whitespace)
(setq whitespace-style '(face tabs tab-mark space-before-tab trailing))
(global-whitespace-mode 1)
(global-auto-revert-mode 1)

(add-hook 'server-visit-hook 'call-raise-frame)
(defun call-raise-frame ()
  (raise-frame))

(require 'server)
(defun server-ensure-safe-dir (dir) t)
(server-start)
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; move the buffer
(autoload 'buffer-move "buffer-move")
(global-set-key (kbd "<C-M-up>")     'buf-move-up)
(global-set-key (kbd "<C-M-down>")   'buf-move-down)
(global-set-key (kbd "<C-M-left>")   'buf-move-left)
(global-set-key (kbd "<C-M-right>")  'buf-move-right)

;; window move
(require 'windmove)
(global-set-key (kbd "ESC <left>")  'windmove-left)
(global-set-key (kbd "ESC <right>") 'windmove-right)
(global-set-key (kbd "ESC <up>")    'windmove-up)
(global-set-key (kbd "ESC <down>")  'windmove-down)

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

;; (require-package 'undo-tree)
;; (require 'undo-tree)
;; (global-undo-tree-mode)

(require-package 'rainbow-mode)
(require 'rainbow-mode)
(define-globalized-minor-mode global-rainbow-mode
  rainbow-mode rainbow-turn-on
  :initialize 'custom-initialize-delay
  :init-value (not (or noninteractive emacs-basic-display))
  :group 'rainbow
  :version "24")
(global-rainbow-mode)

;; (require-package 'color-theme)
;; (require-package 'load-theme-buffer-local)
;; (require-package 'leuven-theme)
;; (load-theme 'leuven t)
;; (require 'molokai-theme)
;; (set-face-attribute 'region nil :background "#866")

(setq everything-ffap-integration nil) ; to disable ffap integration
(setq everything-cmd "C:\\Users\\bichongl\\OneDrive\\app\\es.exe")        ;; to let everything.el know where to find es.exe
(require 'everything)
(defalias 'es 'everything)

;; (require-package 'ace-jump-mode)
;; (autoloaddcdcscdcscdcascs
  ;; 'ace-jump-mode
  ;; "ace-jump-mode"
  ;; "Emacs quick move minor mode"
  ;; t)
;; (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require-package 'avy)
(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "C-f") 'avy-goto-line)
(global-set-key (kbd "C-j") 'goto-line)

(require-package 'anzu)
(global-anzu-mode +1)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

(require-package 'nyan-mode)
(case window-system
  ((x w32) (nyan-mode)))

(require-package 'powerline)
(require 'powerline)
(setq powerline-arrow-shape 'arrow)
(powerline-default-theme)
(setq powerline-default-separator-dir '(right . left))

(require-package 'evil)
(require 'evil)
(evil-mode 0)

;; (require-package 'spacemacs-theme)
;; (load-theme 'spacemacs-dark t)

(require-package 'which-key)
(require 'which-key)
(which-key-mode)

(require-package 'evil-leader)
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(require-package 'window-numbering)
(require 'window-numbering)
(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
      (evil-leader/set-key
        "0" 'select-window-0
        "1" 'select-window-1
        "2" 'select-window-2
        "3" 'select-window-3
        "4" 'select-window-4
        "5" 'select-window-5
        "6" 'select-window-6
        "7" 'select-window-7
        "8" 'select-window-8
        "9" 'select-window-9)
      (window-numbering-mode 1)

(require-package 'evil-jumper)
(require 'evil-jumper)
(global-evil-jumper-mode)

(require-package 'evil-escape)
(require 'evil-escape)
(global-set-key (kbd "C-c C-g") 'evil-escape)
(require-package 'key-chord)
(require 'key-chord)
(key-chord-mode 1)
(setq-default evil-escape-delay 0.2)
(key-chord-define evil-insert-state-map  "jk" 'evil-normal-state)

(require-package 'hungry-delete)
(require 'hungry-delete)
(global-hungry-delete-mode t)
(provide 'init-pack)
