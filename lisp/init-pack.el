;;run M-x esup, and watch the magic happen.
;; (require-package 'esup)
;; (require 'esup)
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

(require 'ido)
(ido-mode t)

(require-package 'xah-find)
(autoload 'xah-find-text "xah-find" "find replace" t)
(autoload 'xah-find-text-regex "xah-find" "find replace" t)
(autoload 'xah-find-replace-text "xah-find" "find replace" t)
(autoload 'xah-find-replace-text-regex "xah-find" "find replace" t)
(autoload 'xah-find-count "xah-find" "find replace" t)

(require 'bm)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)

(require-package 'browse-kill-ring)
(require 'browse-kill-ring)
(global-set-key [(meta y)] 'browse-kill-ring)

;;dired plus
;; (require-package 'dired+)
;; (require 'dired+)
;; (toggle-diredp-find-file-reuse-dir 1)

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
(require 'buffer-move)
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

(require-package 'undo-tree)
(require 'undo-tree)
(global-undo-tree-mode)

(require-package 'rainbow-mode)
(require 'rainbow-mode)
(define-globalized-minor-mode global-rainbow-mode
  rainbow-mode rainbow-turn-on
  :initialize 'custom-initialize-delay
  :init-value (not (or noninteractive emacs-basic-display))
  :group 'rainbow
  :version "24")
(global-rainbow-mode)

(setq everything-ffap-integration nil) ; to disable ffap integration
(setq everything-cmd "C:\\Users\\bichongl\\OneDrive\\app\\es.exe")        ;; to let everything.el know where to find es.exe
(require 'everything)
(defalias 'es 'everything)

(require-package 'nyan-mode)
(case window-system
  ((x w32) (nyan-mode)))

(require-package 'avy)
(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "C-f") 'avy-goto-line)
(global-set-key (kbd "C-j") 'goto-line)

(require-package 'anzu)
(global-anzu-mode +1)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)

(require-package 'powerline)
(require 'powerline)
(setq powerline-arrow-shape 'arrow)
(powerline-default-theme)
(setq powerline-default-separator-dir '(right . left))

;; (require-package 'helm-projectile)
;; (projectile-global-mode)
;; (setq projectile-completion-system 'helm)
;; (helm-projectile-on)
;; (setq projectile-indexing-method 'alien)

;; (require-package 'spacemacs-theme)
;; (require 'spacemacs-dark-theme)

(require-package 'hungry-delete)
(require 'hungry-delete)
(global-hungry-delete-mode t)

(require-package 'vlf)
(require 'vlf)

(require-package 'web-mode)
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require-package 'powershell)
(autoload 'powershell-mode "powershell-mode" "A editing mode for Microsoft PowerShell." t)
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode)) ; PowerShell script

(provide 'init-pack)
