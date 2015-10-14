;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(defconst my-emacs-lisps-path "~/.emacs.d/lisp/" "my emacs root")
;; define the start time before loading no configuration
(defvar *emacs-load-start* (current-time))
(require 'init-func)
(require 'init-site-lisp)
(require 'init-elpa)
(require 'init-pack)
(require 'init-helm)
(require 'init-dev)
(require 'init-misc)


;; show time
(let* ((time (current-time))
       (low-sec (nth 1 time))
       (micro-sec (nth 2 time)))
  (message "load time: %dms"
           (/ (+ (* (- low-sec (nth 1 *emacs-load-start*)) 1000000)
                 (- micro-sec (nth 2 *emacs-load-start*))) 1000)))
(provide 'init)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default default default italic underline success warning error])
 '(custom-safe-themes (quote ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "63b553b4087f4cc9b0ce5b1096f3402dbc23387da1a3d261984cf28499bae12b" "9e1e2e7590c2f443c09a3f6240a05ada53f06566a6873c37eeae10d13dc372c9" default)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
