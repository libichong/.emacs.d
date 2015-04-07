;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver 23))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; define the start time before loading no configuration
(defvar *emacs-load-start* (current-time))

(require 'init-misc)
(require 'init-func)
(require 'init-site-lisp)
(require 'init-elpa)
(require 'init-pack)
(require 'init-helm)
(require 'init-dev)
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
