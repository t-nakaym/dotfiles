;;; custom command settings

;;; move window or split window if there is one window
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (if (> (frame-width) 140)
        (split-window-horizontally)
      (split-window-vertically)))
  (other-window 1))
(global-set-key (kbd "C-M-o") 'other-window-or-split)
