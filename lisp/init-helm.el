(require-package 'helm)
(require 'helm-config)
(helm-mode 1)


(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

;;helm-M-x
(global-set-key (kbd "M-x") 'helm-M-x)
(setq helm-M-x-fuzzy-match t) ;; optional fuzzy matching for helm-M-x

;;helm-mini
(global-set-key (kbd "C-x b") 'helm-mini)
(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)
;; Example:
;; If I enter in pattern prompt: *lisp ^helm @moc, Helm will narrow down the list by selecting only buffers that are in lisp mode, start by helm and match "moc" in their contents.
;; If I want to specify more than one major-mode, separate them with ,, e.g *!lisp,!sh,!fun will list all buffers but the ones in lisp-mode, sh-mode and fundamental-mode.
;; If I enter in pattern prompt: *lisp ^helm moc. Notice there is no @ this time helm will look for lisp mode buffers starting by "helm" and have "moc" in their name.
;; If I enter in pattern prompt: *!lisp !helm Helm will narrow down to buffers that are not in "lisp" mode and that do not match "helm".
;; If I enter in pattern prompt: /helm/ w3 Helm will narrow down buffers that are in any "helm" sub-directory and matching w3.

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

;;helm-autoresize
(helm-autoresize-mode t)
;;(setq helm-autoresize-min-height 30)
;;(setq helm-autoresize-max-height 30)

(when (executable-find "ack-grep")
  (setq helm-grep-default-command "ack-grep -Hn --no-group --no-color %e %p %f"
        helm-grep-default-recurse-command "ack-grep -H --no-group --no-color %e %p %f"))


(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key global-map "\C-z" 'helm-semantic-or-imenu)
(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c g")   'helm-google-suggest)
(global-set-key (kbd "C-M-s") 'helm-occur)
(global-set-key (kbd "C-M-r") 'helm-regexp) ;; sinimar with helm-occur,but regex
(global-set-key (kbd "C-M-f") 'helm-do-grep) ;; grep from the current folder
(global-set-key (kbd "C-h m") 'helm-all-mark-rings) ;; show all marked string, what is marked?

(require-package 'helm-swoop)
(require 'helm-swoop)
;; ;; Change keybinds to whatever you like :)
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)


(provide 'init-helm)
