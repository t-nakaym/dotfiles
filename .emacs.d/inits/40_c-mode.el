;;; for c-mode

; (install-elisp "http://google-styleguide.googlecode.com/svn/trunk/google-c-style.el")
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(add-hook 'c-mode-hook
          '(lambda ()
             (setq c-basic-offset 4)))
