;;; for anything.el
; (auto-install-batch "anything")
(require 'anything-startup)

(defun my-anything ()
  (interactive)
  (anything-other-buffer
   '(anything-c-source-buffers+
     anything-c-source-recentf
     anything-c-source-files-in-current-dir
     anything-c-source-file-name-history
     anything-c-source-locate)
   " *my-anything*"))

(define-key global-map (kbd "M-;") 'my-anything)
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)
