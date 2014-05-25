;;�������ʾ��ǰbuffer��һ����Ԥ����minibar.
(require 'minimap)

(defvar minimap-window nil)
(defun minimap-toggle ()

  "Toggle the minimap."
  (interactive)
  (if (and minimap-window
           (window-live-p minimap-window))
      (minimap-kill)
    (minimap-create)))
    
;;(global-set-key (kbd "C-c m") 'minimap-toggle) ;;only fork version
(global-set-key (kbd "C-c m") 'minimap-create)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide 'minimap-settings)
