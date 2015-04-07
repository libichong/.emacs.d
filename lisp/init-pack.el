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

(require-package 'projectile)
(require 'projectile)
(projectile-global-mode)
;;(setq find-program "C:\\Users\\bichongl\\.babun\\cygwin\\bin\\find.exe")
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)
(setq projectile-switch-project-action 'helm-projectile-find-file)

;; Press Command-p for fuzzy find in project
(global-set-key (kbd "\C-o") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "\C-b") 'projectile-switch-to-buffer)

(require-package 'helm-projectile)
(require 'helm-projectile)
(helm-projectile-on)

(setq everything-ffap-integration nil) ; to disable ffap integration
(setq everything-cmd "C:\\Users\\bichongl\\OneDrive\\app\\es.exe")        ;; to let everything.el know where to find es.exe
(require 'everything)
(defalias 'es 'everything)

(require-package 'nyan-mode)
(case window-system
  ((x w32) (nyan-mode)))

(require-package 'anzu)
(global-anzu-mode +1)

(require-package 'powerline)
(require 'powerline)
(setq powerline-arrow-shape 'arrow)
(powerline-default-theme)
(setq powerline-default-separator-dir '(right . left))
(provide 'init-pack)
