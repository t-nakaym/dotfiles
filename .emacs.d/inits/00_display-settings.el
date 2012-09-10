;;; display settings

;;; font-lock settings
(set-face-foreground 'font-lock-comment-face "red1")
(if (<= emacs-major-version 21)
    (global-font-lock-mode t))
