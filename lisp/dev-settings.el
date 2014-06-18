(require-package 'ctypes)
(require 'ctypes)
(require 'sdenv-settings)
(require 'xcscope);; it provide cscope-index-file which call cscope-indexer.bat
(require-package 'helm-gtags)
(require 'helm-gtags)
(require 'csingleton)

(setq-default c-indent-tabs-mode t     ; Pressing TAB should cause indentation
                c-indent-level 4         ; A TAB is equivilent to four spaces
                c-argdecl-indent 0       ; Do not indent argument decl's extra
                c-tab-always-indent t
                backward-delete-function nil) ; DO NOT expand tabs when deleting
(c-add-style "microsoft"
              '("stroustrup"
                (c-offsets-alist
                 (innamespace . -)
                 (inline-open . 0)
                 (inher-cont . c-lineup-multi-inher)
                 (arglist-cont-nonempty . +)
                 (template-args-cont . +))))
(setq c-default-style "microsoft")
(defun my-c-mode-hook ()
  (require 'ctypes)
  (turn-on-font-lock)
  (c-set-style "microsoft")
  (c-set-offset 'substatement-open '0) ; brackets should be at same indentation level as the statements they open
  (c-set-offset 'inline-open '+)
  (c-set-offset 'block-open '+)
  (c-set-offset 'brace-list-open '+)   ; all "opens" should be indented by the c-indent-level
  (c-set-offset 'case-label '+))       ; indent case labels by c-indent-level, too
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

(defun my:c++-init ()
  (auto-complete-mode 1)
  (imenu-add-menubar-index)
  (which-function-mode 1)
  (hs-minor-mode 1)
  (gtags-mode 1)
  (font-lock-add-keywords nil
                          '(("\\<\\(FIXME\\|TODO\\|TBD\\|BUG\\):" 1 font-lock-warning-face t)))
  (linum-mode 1)
  (toggle-truncate-lines 1)
  (c-set-offset 'innamespace 0)
  )

(defun my-ctypes-load-hook ()
   (ctypes-read-file "~/.ctypes_std_c" nil t t))
(add-hook 'ctypes-load-hook 'my-ctypes-load-hook)
(setq ctypes-write-types-at-exit t)
;;(ctypes-read-file nil nil t t)
(ctypes-auto-parse-mode 1)


(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my:c++-init)

(require 'gtags)
(global-set-key (kbd "M-.") 'gtags-find-tag)
(global-set-key (kbd "M-*") 'gtags-pop-stack)


(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
             (local-set-key (kbd "C-c C-f") 'helm-gtags-find-files)))

(defun my-csharp-mode-fn ()
     "function that runs when csharp-mode is initialized for a buffer."
     (turn-on-auto-revert-mode)
     (setq indent-tabs-mode nil)
     (auto-complete-mode 1)
     )
(add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)

(defun my-python-mode-fn ()
     "function that runs when csharp-mode is initialized for a buffer."
     (turn-on-auto-revert-mode)
     (setq indent-tabs-mode nil)
     (auto-complete-mode 1)
     (setq python-indent-offset 4)
     (setq python-indent-guess-indent-offset nil)
     )
(add-hook  'python-mode-hook 'my-python-mode-fn t)

(global-set-key (kbd "<f8>") 'gcc)
(defun gcc()
  (interactive)
  ;; 查找 Makefile
  (let ((candidate-make-file-name '("makefile" "Makefile" "GNUmakefile"))
        (command nil))
    (if (not (null
              (find t candidate-make-file-name :key
                    '(lambda (f) (file-readable-p f)))))
        (setq command "make -k ")
      ;; 没有找到 Makefile ，查看当前 mode 是否是已知的可编译的模式
      (if (null (buffer-file-name (current-buffer)))
          (message "Buffer not attached to a file, won't compile!")
        (if (eq major-mode 'c-mode)
            (setq command
                  (concat "gcc.exe -Wall -o "      ;;你要明确知道自己的编译器在哪里,
                          (file-name-sans-extension                          ;;这样,用你的gcc.exe的地址代替这里的D:/Dev-Cpp/bin/gcc.exe
                           (file-name-nondirectory buffer-file-name)) ;;注意,这里的路径的斜杠和vista的习惯相反,你要注意修改
                          " "
                          (file-name-nondirectory buffer-file-name)
                          " -g -lm "))
          (if (eq major-mode 'c++-mode)
              (setq command
                    (concat "g++.exe -Wall -o " ;;还有这里的g++,也同gcc一样...
                            (file-name-sans-extension
                             (file-name-nondirectory buffer-file-name))
                            " "
                            (file-name-nondirectory buffer-file-name)
                            " -g -lm "))
            (message "Unknow mode, won't compile!")))))
    (if (not (null command))
        (let ((command (read-from-minibuffer "Compile command: " command)))
          (compile command)))))


;; This version uses lwarn instead of message-box in the original version.
;; lwarn will open another window, and display the warning in there.
(defun flymake-display-warning (warning)
  "Display a warning to the user, using lwarn"
  (lwarn 'flymake :warning warning))

;; Using lwarn might be kind of annoying on its own, popping up windows and
;; what not. If you prefer to recieve the warnings in the mini-buffer, use:
(defun flymake-display-warning (warning)
  "Display a warning to the user, using lwarn"
  (message warning))

(provide 'dev-settings)
